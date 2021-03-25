/**
 * 
 */
package kr.quantumsoft.koreasurvey.utils;

/**
 * @author Seo
 *
 */
public class Paging {
	private Integer pageSize;
	private Integer firstPageNo;
	private Integer prevPageNo;
	private Integer startPageNo;
	private Integer pageNo;
	private Integer endPageNo;
	private Integer nextPageNo;
	private Integer finalPageNo;
	private Integer totalCount;
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getFirstPageNo() {
		return firstPageNo;
	}
	public void setFirstPageNo(Integer firstPageNo) {
		this.firstPageNo = firstPageNo;
	}
	public Integer getPrevPageNo() {
		return prevPageNo;
	}
	public void setPrevPageNo(Integer prevPageNo) {
		this.prevPageNo = prevPageNo;
	}
	public Integer getStartPageNo() {
		return startPageNo;
	}
	public void setStartPageNo(Integer startPageNo) {
		this.startPageNo = startPageNo;
	}
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public Integer getEndPageNo() {
		return endPageNo;
	}
	public void setEndPageNo(Integer endPageNo) {
		this.endPageNo = endPageNo;
	}
	public Integer getNextPageNo() {
		return nextPageNo;
	}
	public void setNextPageNo(Integer nextpageNo) {
		this.nextPageNo = nextpageNo;
	}
	public Integer getFinalPageNo() {
		return finalPageNo;
	}
	public void setFinalPageNo(Integer finalPageNo) {
		this.finalPageNo = finalPageNo;
	}
	public Integer getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
		this.makePaging();
	}
	
	//페이지 생성
	private void makePaging() {
		if(this.totalCount == 0) return; //게시 글 전체 수가 없는 경우
		if(this.pageNo == 0) this.setPageNo(1); // 기본 값 설정
		if(this.pageSize == 0) this.setPageSize(10); // 기본 값 설정
		
		int finalPage = (totalCount + (pageSize -1)) / pageSize; // 마지막 페이지
		if (this.pageNo > finalPage) this.setPageNo(finalPage); // 기본값 설정
		
		if (this.pageNo < 0 || this.pageNo > finalPage) this.pageNo = 1; // 현재페이지 유효성 체크
		
		boolean isNowFirst = pageNo == 1 ? true : false; // 시작 페이지(전체)
		boolean isNowFinal = pageNo == finalPage ? true : false; // 마지막 페이지(전체)
		
		int startPage = ((pageNo-1) / 10) * 10 + 1; // 시작 페이지(페이징 네비 기준)
		int endPage = startPage + 10 - 1; // 끝 페이지(페이징 네비 기준)
		
		if (endPage > finalPage) { // [마지막 페이지 (페이징 네비 기준) > 마지막 페이지]
			endPage = finalPage;
		}
		
		this.setFirstPageNo(1); // 첫 번째 페이지 번호
		
		if(isNowFirst) {
			this.setPrevPageNo(1); // 이전 페이지 번호
		} else {
			this.setPrevPageNo(((pageNo - 1) < 1 ? 1 : (pageNo - 1))); // 이전 페이지 번호 
		}
		
		this.setStartPageNo(startPage); // 시작 페이지(페이징 네비 기준)
		this.setEndPageNo(endPage); // 끝 페이지(페이징 네비 기준)
		
		if (isNowFinal) {
			this.setNextPageNo(finalPage); // 다음 페이지 번호
		} else {
			this.setNextPageNo(((pageNo + 1) > finalPage ? finalPage : (pageNo + 1))); // 다음 페이지 번호
		}
		
		this.setFinalPageNo(finalPage); // 마지막 페이지 번호
	}
}
