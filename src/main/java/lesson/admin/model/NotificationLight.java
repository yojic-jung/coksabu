package lesson.admin.model;

public class NotificationLight {
	private int certifyCount;
	private int delLessonCount;
	private int qnaCount;
	private int lessonTranCount;
	private int lessonRefundCount;
	private int chatTranCount;
	private int chatRefundCount;
	
	public void setCertifyCount(int certifyCount) {
		this.certifyCount=certifyCount;
	}
	public int getCertifyCount() {
		return certifyCount;
	}
	
	public void setDelLessonCount(int delLessonCount) {
		this.delLessonCount=delLessonCount;
	}
	public int getDelLessonCount() {
		return delLessonCount;
	}
	
	public void setQnaCount(int qnaCount) {
		this.qnaCount=qnaCount;
	}
	public int getQnaCount() {
		return qnaCount;
	}
	
	public void setLessonTranCount(int lessonTranCount) {
		this.lessonTranCount=lessonTranCount;
	}
	public int getLessonTranCount() {
		return lessonTranCount;
	}
	
	public void setLessonRefundCount(int lessonRefundCount) {
		this.lessonRefundCount=lessonRefundCount;
	}
	public int getLessonRefundCount() {
		return lessonRefundCount;
	}
	
	public void setChatTranCount(int chatTranCount) {
		this.chatTranCount=chatTranCount;
	}
	
	public int getChatTranCount() {
		return chatTranCount;
	}
	
	public void setChatRefundCount(int chatRefundCount) {
		this.chatRefundCount=chatRefundCount;
	}
	
	public int getChatRefundCount() {
		return chatRefundCount;
	}
}
