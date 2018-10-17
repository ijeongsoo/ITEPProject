package kr.co.ibk.itep.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import kr.co.ibk.itep.controller.SessionedController;
import kr.co.ibk.itep.dto.EmpJoinedDep;
import javax.servlet.http.HttpServletRequest;

@Component
@Aspect
public class LoginCheckAspect {
	private static final Logger logger = LoggerFactory.getLogger(SessionedController.class);

	@Pointcut("execution(public * kr.co.ibk.itep.controller.NonSessionedController.*(..))")
	private void nonSession() {
	}

	@Pointcut("execution(public * kr.co.ibk.itep.controller.SessionedController.*(..))")
	private void session() {
	}

	// Advice
	@Around("nonSession()")
	public Object nonSessionCheckAdvice(ProceedingJoinPoint joinPoint) throws Throwable {
		// before code

		RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
		EmpJoinedDep empJoinedDep = (EmpJoinedDep) requestAttributes.getAttribute("login_info",
				RequestAttributes.SCOPE_SESSION);
		if (empJoinedDep != null) {
			return "redirect:home?ssoid=" + empJoinedDep.getEmn();
		} else {
			Object result = joinPoint.proceed();
			return result;
		}

	}

	@Around("session()")
	public Object sessionCheckAdvice(ProceedingJoinPoint joinPoint) throws Throwable {
		// before code
		
		RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
		EmpJoinedDep empJoinedDep = (EmpJoinedDep) requestAttributes.getAttribute("login_info",
				RequestAttributes.SCOPE_SESSION);

		if (empJoinedDep == null) {
			return "redirect:/";
		}else{
			Object result = joinPoint.proceed();
			return result;
		}

	}
}
