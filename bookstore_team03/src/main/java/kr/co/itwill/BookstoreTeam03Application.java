package kr.co.itwill;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

/*import kr.co.itwill.event.Qscheduler;*/

@SpringBootApplication(exclude = DataSourceAutoConfiguration.class)
public class BookstoreTeam03Application {
	
	/*@Autowired
	private Qscheduler scheduler;*/

	public static void main(String[] args) {
		SpringApplication.run(BookstoreTeam03Application.class, args);
	}//main end
	
	
	@Bean
    public DataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("org.mariadb.jdbc.Driver");
        dataSource.setUrl("jdbc:mariadb://itwill.cnmq3ywavcn5.ap-northeast-2.rds.amazonaws.com:3306/itwill");
        dataSource.setUsername("admin");
        dataSource.setPassword("admin1234");
        System.out.println("-----Maria DB 연결 성공!!!!!!!!!!");
        return dataSource;
    }
	
	//Mapper 객체 생성
	@Bean //<-스프링 컨테이터가 자동으로 객체 생성
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
		System.out.println("-----sqlSessionFactory() 호출됨");
		SqlSessionFactoryBean bean=new SqlSessionFactoryBean();
		bean.setDataSource(dataSource);
		Resource[] res=new PathMatchingResourcePatternResolver().getResources("classpath:mappers/*.xml");
		bean.setMapperLocations(res);
		return bean.getObject();		
	}//sqlSessionFactory() end

	
	@Bean
	public SqlSessionTemplate sqlSession(SqlSessionFactory factory) {
		System.out.println("-----sqlSession() 호출됨");
		return new SqlSessionTemplate(factory);
	}//sqlSession() end
	
}
