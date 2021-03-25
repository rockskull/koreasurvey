/**
 * 
 */
package kr.quantumsoft.koreasurvey.model;

import java.util.Date;

/**
 * @author Seo
 *
 */
public class Boards {
	private String boardName;
	private Integer id;
	private Integer userid;
	private Integer isnotice = 0;
	private String title;
	private String content;
	private Date created;
	private Date deleted;
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Integer getIsnotice() {
		return isnotice;
	}
	public void setIsnotice(Integer isnotice) {
		this.isnotice = isnotice;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	public Date getDeleted() {
		return deleted;
	}
	public void setDeleted(Date deleted) {
		this.deleted = deleted;
	}
}
