package kr.co.itwill.event;

import java.time.LocalDate;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class IntervalJab implements Job {
	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		//현재요일구하기
		LocalDate now = LocalDate.now();
		
		//현재요일에 해당하는 숫자반환(월요일1)
		int dayOfWeekValue = now.getDayOfWeek().getValue();
		
		System.out.println("--job수행--");
	    System.out.println(dayOfWeekValue);
	    
	  
	}//execute() end

}//class end
