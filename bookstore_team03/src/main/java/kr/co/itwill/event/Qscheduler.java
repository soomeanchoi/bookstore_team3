package kr.co.itwill.event;

import javax.annotation.PostConstruct;

import org.quartz.CronScheduleBuilder;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;
import org.springframework.stereotype.Component;

@Component
public class Qscheduler {
	private SchedulerFactory schedulerFactory;
    private Scheduler scheduler;
    
    @PostConstruct
    public void start() throws SchedulerException{
    
    	schedulerFactory = new StdSchedulerFactory();
    	scheduler = schedulerFactory.getScheduler();
    	scheduler.start();
    
    	//job 지정
    	JobDetail job = JobBuilder.newJob(IntervalJab.class).withIdentity("resetJob").build();
    
    	//trigger 생성
    	Trigger trigger = TriggerBuilder.newTrigger().
    			withSchedule(CronScheduleBuilder.cronSchedule("15 * * * * ?")).build();
//    	startAt 과 endAt 을 사용해 job 스케줄의 시작, 종료 시간도 지정할 수 있다.
//    	Trigger trigger = TriggerBuilder.newTrigger().startAt(startDateTime).endAt(EndDateTime)
//            .withSchedule(CronScheduleBuilder.cronSchedule("*/1 * * * *")).build();
		scheduler.scheduleJob(job, trigger);
    }//end
}//class end
