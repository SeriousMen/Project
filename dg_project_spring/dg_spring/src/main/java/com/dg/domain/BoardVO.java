package com.dg.domain;

import java.util.List;

import lombok.Data;

@Data // 롬복을 활용해서 getter,setter,hashCode,toString 등을 생성해준다.
// 주의할 점은 여기서 기본 생성자(@NoArgsConstructor)를 생성해주는 것이 아니라,@RequiredArgsConstructor가 생성되는 것이며
//즉, final 접근자가 필드에 붙거나 @Nonnull 애노테이션이 붙은 필드를 가진 생성자가 만들어진다. 아무것도 없으면 당연히 기본 생성자
public class BoardVO {
	/*CREATE TABLE DS_BOARD(
   BNO NUMBER(10),
   BOARD NUMBER(10),
   TITLE VARCHAR2(200) NOT NULL,
   CONTENT VARCHAR2(2000) NOT NULL,
   WRITER VARCHAR2(200) NOT NULL,
   REGDATE DATE DEFAULT SYSDATE,
   UPDATEDATE DATE DEFAULT SYSDATE
);*/
	private Long bno;
	private Long boardNum;
	private String title;
	private String content;
	private String writer;
	private String regDate;
	private String updateDate;
	
	//게시글을 등록할 때 input태그 name에 attachList[i].fileName 이런식으로 보낼거라서 해당 자료형을 가진 필드를 만들어준다.
	private List<BoardAttachVO> attachList;
	
	
}
