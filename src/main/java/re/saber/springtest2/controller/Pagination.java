package re.saber.springtest2.controller;

public class Pagination {

	private int begin;

	private int end;

	private int cur;

	private int last;

	public Pagination(int cur, int total, int rowsPerPage, int numOfPages) {
		this.cur = cur;
		this.last = total > 0 ? (total - 1) / rowsPerPage + 1 : 1;
		this.begin = (cur - 1) / numOfPages * numOfPages + 1;
		if (begin < 0)
			begin = 1;
		this.end = this.begin + numOfPages - 1;
		if (this.end > last)
			this.end = last;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getCur() {
		return cur;
	}

	public void setCur(int cur) {
		this.cur = cur;
	}

	public int getPrevious() {
		return cur > 1 ? cur - 1 : 1;
	}

	public boolean getHasPrevious() {
		return cur > 1;
	}

	public int getNext() {
		return cur < last ? cur + 1 : last;
	}

	public boolean getHasNext() {
		return cur < last;
	}

}
