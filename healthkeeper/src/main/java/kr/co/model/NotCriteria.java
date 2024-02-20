package kr.co.model;

import lombok.Data;

@Data
public class NotCriteria {
	
	// 현재 페이지
    private int pageNum;
    
    // 한 페이지 당 보여질 게시물 갯수
    private int amount;
    
    //pageNum = 1, amount = 10
    public NotCriteria() {
        this(1,10);
    }
    
    // 생성자 => 원하는 pageNum, 원하는 amount
    public NotCriteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }

}
