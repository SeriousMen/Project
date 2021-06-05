package com.dg.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dg.domain.AllFileDTO;
import com.dg.domain.BoardAttachVO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Log4j
@Controller
//@AllArgsConstructor 해당 컨트롤러는 service를 실행해서 응답을 하는 것이 아닌 ajax로 파일에 관한 처리를 요청했을 때 자료를 정제해서 넘길 목적으로 만들었다.

public class UploadController {

	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName){
		log.info("fileName :" +fileName);
		File file = new File("C:\\dsUpload\\"+fileName);
		
		ResponseEntity<byte[]> result = null;
		
		HttpHeaders header = new HttpHeaders();
		
		//값을 전달할 때 어떤 타입의 자료인지 알려줘야 decoding을 할 수 있기 때문에 probeContentType메소드를 통해서 해당
		try {
			header.add("Content-Type", Files.probeContentType(file.toPath()));
							//해당 file을 바이트 배열로 카피하고 헤더에 컨텐츠 타입을 담아서 보낸다.
			result= new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	//파일첨부할 때
	@PostMapping(value="/uploadAjaxAction",consumes="multipart/form-data", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<AllFileDTO> uploadAjaxAction(MultipartFile[] uploadFile){
		log.info("uploadAjax..!");
		String uploadFolder = "C:\\dsUpload";
		String uploadFolderPath = getFolder();
		
		//new File(a,b)는 a라는 상위주소에 b라는 하위주소 혹은 파일 이름을 생성해준다.
		File uploadPath = new File(uploadFolder, uploadFolderPath); // 위의 상위 디렉토리에 하위 디렉토리를 추가로 만들어준다.
		
		//업로드한 파일을 업로드 성공한 파일과 실패한 파일로 구분하기 위한 객체를 가져온다.
		AllFileDTO allFile = new AllFileDTO();
		
		List<BoardAttachVO> succeedList = new ArrayList<>();
		List<BoardAttachVO> failureList = new ArrayList<>();
		
		InputStream in = null;
		
		if(!uploadPath.exists()) {//만일 해당 경로가 존재하지 않는다면 
			uploadPath.mkdirs(); //해당 경로를 만들어줘라 
			//mkdir : 상위 디렉토리가 없다면 디렉토리(파일)을 생성할 수 없다. 
			//mkdirs : 상위 디렉토리가 없다면 상위 디렉토리까지 생성해준다.
		}
		
		for(MultipartFile multipartFile : uploadFile) {
			log.info("========================");
			log.info("업로드 파일 명:" + multipartFile.getName());
			log.info("업로드 파일 크기: "+ multipartFile.getSize());
			BoardAttachVO boardAttachVO = new BoardAttachVO();
			
			String uploadFileName = multipartFile.getOriginalFilename(); //경로를 제외한 업로드할 파일 이름만을 받는 메소드
			
			//크롬이 아닌 익스플러어에서는 전체 경로가 나오기 때문에 이렇게 파일네임전의 경로를 자를 수 있도록 명시해주어야 한다.
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			//인터넷 익스플러러가 아니면 못찾아서 실행을 안한다.
			log.info("실제 파일이름 : " + uploadFileName);
			boardAttachVO.setFileName(uploadFileName);
			
			//만일 동일한 파일을 등록하면 파일명이 겹치고 기존의 파일이 사라지기 때문에 uuid를 활용한다.
			UUID uuid = UUID.randomUUID();
			
			uploadFileName = uuid.toString()+"_"+ uploadFileName; // uuid는 - 으로 구분되니까 _로 파일네임을 구분하려한다.
			
			File saveFile = new File(uploadPath, uploadFileName); //위에서 설정한 디렉토리에 파일이름을 생성해준다.
			try {
			multipartFile.transferTo(saveFile);//해당 파일이름으로 파일을 저장해준다.
			in = new FileInputStream(saveFile); //저장함과 동시에 해당 경로에 있는 파일을 읽어온다.//썸네일을 생성하기위해
			
			boardAttachVO.setUuid(uuid.toString());//위에서 설정했던 uuid를 가져온다.
			boardAttachVO.setUploadPath(uploadFolderPath);//어느 폴더에 저장할지 가져온다.
			
			if(checkImg(saveFile)) {//만약에 위에서 저장한 파일이 이미지 파일이라면
				boardAttachVO.setFileType(true);//boolean타입이니까 false가 디폴트라서 true로 설정해준다.
				
				//똑같은 조건에 s_을 파일이름(uuid) 앞에 붙여서 생성해준다
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath,"s_"+uploadFileName));
				
				//Thumbnailator는 자바에서 썸네일을 만들기 위한 클래스이다. 이미지를 리사이즈해서 썸네일을 생성가능하다.
				Thumbnailator.createThumbnail(in,thumbnail,100,100); // in에 담겨진파일을 thumbnail의 정보대로 width, height를 맞춰 저장해라.
				
					thumbnail.close();
			}
			succeedList.add(boardAttachVO); //성공리스트에 성공한 파일객체를 넣어준다.
			} catch (Exception e) {
				failureList.add(boardAttachVO); //실패하면 실패한 리스트에 넣어줘
				e.printStackTrace();
			} finally { //정확히 닫아야할 객체를 알고 있을 때
	            try {
	                if(in != null) {
	                   in.close();
	                }
	             } catch (IOException e) {
	                e.printStackTrace();
	                throw new RuntimeException();
	             }
	          }
				
	       }
		
		allFile.setSucceedList(succeedList);
		allFile.setFailureList(failureList);
		return new ResponseEntity<AllFileDTO>(allFile, HttpStatus.OK); //업로드한 파일의 정보를 리턴해준다.
		
	}
	
	//span태그의 썸네일 취소할 때 경로에 있는 썸네일,이미지와 파일을 지워주도록 처리해주는 것 
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String fileType){ //취소를 요청할 때 올라가 있는 파일은 썸네일이기 때문에 썸네일이 먼저온다.
		log.info("deletedFile :" + fileName);
		
		File file = null;
		
		try {
			file = new File("C:\\dsUpload\\"+URLDecoder.decode(fileName,"UTF-8")); //해당경로에 있는 파일정보를 가져온다.
			
			file.delete(); //그리고 파일 지워 (해당 경로에 존재하는 파일을 지우는 것임 그래서 디렉토리 경로를 찾기 위해 컴퓨터언어로(인코딩)된 것을 문자열 타입으로 디코드
			
			if(fileType.equals("image")) {//만일 이미지 파일이라면 위에 썸네일 파일을 지워주었기 때문에 원본파일도 지워주어야 한다.
				String imgFileName = file.getPath().replace("s_", ""); //위에서 받은 파일에서 s_을 없애주어서 원본파일명과 정보를 동일시한다.
				log.info("imgFileName :"+imgFileName);
				file = new File(imgFileName);
				file.delete();
			}
			
		} catch (UnsupportedEncodingException e) {//오류가 난다면
			
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
		
	}
	
	//만일 이미지파일이 아니라면 클릭시에 다운로드 할 수 있도록 설정 
	
	//응답 시 byte[]로 응답한다.
	@GetMapping(value="/download", produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody		
	//브라우저 종류별로 다운로드 목적으로 출력하는 방식이 다르기 때문에 헤더에서 브라우저 정보를 가져온다.(User-Agent)
	public ResponseEntity<Resource> downloadFile(String fileName, @RequestHeader("User-Agent") String userAgent){
		log.info("download file: "+fileName);
		Resource resource = new FileSystemResource("C:\\dsUpload\\" + fileName);
		log.info("resource :" +resource);
		
		//파일정보를 담아준다.
		String resourceName = resource.getFilename();
		String originalName = resourceName.substring(resourceName.indexOf("_")+1);//uuid를 제외한 원본 파일명 
		//UTF-8로 바이트를 만들면 다시 UTF-8로 해서 풀어준다.
		// APPLICATION_OCTET_STREAM_VALUE 전달할 때는 ISO-8859-1로 다운로드해서 출력할 때는 UTF-8로 변환
		HttpHeaders headers = new HttpHeaders();
		//다운로드 시 저장되는 이름 : Content-Disposition attachment라고 써놔야 첨부파일로 인식한다.
		try {
			
			String downloadName = null;
			
			//브라우저별로 다운로드 될 파일명의 인코딩 설정을 진행한다.
			if(userAgent.contains("Trident")) {
				//Trident : MSIE
				log.info("IE Browser");
				downloadName = URLEncoder.encode(originalName,"UTF-8"); 
			}else if(userAgent.contains("Edg")) {
				//Edg:엣지
				log.info("Edg");
				downloadName = URLEncoder.encode(originalName,"UTF-8");
			}else {
				//그외 (크롬)
				log.info("chrome");
				downloadName = new String(originalName.getBytes("UTF-8"),"ISO-8859-1");
			}
			
			headers.add("Content-Disposition", "attachment; filename=" +downloadName); //문자열이 아니라 첨부하기 위한 바이트 배열이라고 헤더에 담아서 알려주기
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
		
	}
	
	// 첨부파일 폴더에 들어 갔을 때 날짜에따라 구별하기 위한 디렉토리 만들기
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date); //년 원 일 설정을 담아줌 
		// 파일의 디렉토리 설정에 맞게 현재 날짜에서 -를 \\로 변경해준다.
		return str.replace("-", File.separator); //file.separator는 상위 디펙토리에서 하위 디렉토리로 갈 때 구분점 
	}
	
	private boolean checkImg(File file) throws IOException {
		//사용자가 업로드한 파일의 타입 중 앞부분이 image로 시작한다면 이미지 파일이다.
		return Files.probeContentType(file.toPath()).startsWith("image"); //image라는 문자열로 시작하는 값
		//probeContentType은 해당 경로에 있는 파일의 타입이 뭔지 리턴해줌  startsWith은 boolean타입으로 문두에 해당 키워드가 있는 지 검사 
	}
}
