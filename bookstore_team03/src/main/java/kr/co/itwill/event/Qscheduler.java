/*
 * package kr.co.itwill.event;
 * 
 * import javax.annotation.PostConstruct;
 * 
 * import org.quartz.CronScheduleBuilder; import org.quartz.JobBuilder; import
 * org.quartz.JobDetail; import org.quartz.Scheduler; import
 * org.quartz.SchedulerException; import org.quartz.SchedulerFactory; import
 * org.quartz.Trigger; import org.quartz.TriggerBuilder; import
 * org.quartz.impl.StdSchedulerFactory; import
 * org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Component;
 * 
 * @Component public class Qscheduler { private SchedulerFactory
 * schedulerFactory; private Scheduler scheduler;
 * 
 * //@Autowired //JobDetail job;
 * 
 * @PostConstruct public void start() throws SchedulerException{
 * 
 * schedulerFactory = new StdSchedulerFactory(); scheduler =
 * schedulerFactory.getScheduler(); scheduler.start();
 * 
 * //job 지정 JobDetail job =
 * JobBuilder.newJob(IntervalJab.class).withIdentity("resetJob").build();
 * 
 * //매주 월요일 00시 00분 00초에 동작하는 trigger 생성 Trigger trigger =
 * TriggerBuilder.newTrigger().
 * withSchedule(CronScheduleBuilder.cronSchedule("0 * * ? * TUE")).build();
 * 
 * scheduler.scheduleJob(job, trigger); }//end }//class end
 */