package com.batdongsan.security;

import com.batdongsan.util.SecurityUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Component
public class CustomSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException {
		String targetUrl = determineTargetUrl(authentication); // định tuyến url cần trả về
		if (response.isCommitted()) {
			return;
		}
		redirectStrategy.sendRedirect(request, response, targetUrl);
	}

	private String determineTargetUrl(Authentication authentication) {
		// if role.getcode is admin -> admin-home
		// if role.getcode is user -> trang-chu
		String url = "";
		List<String> roles = SecurityUtils.getAuthorities();
		if(isAdmin(roles)) {
			url = "/admin";
		}
		else if(isUser(roles)) {
			url = "/";
		}
		return url;
	}
	
	private boolean isAdmin(List<String> roles) {
		if(roles.contains("admin")) {
			return true;
		}
		return false;
	}
	
	private boolean isUser(List<String> roles) {
		if(roles.contains("user")) {
			return true;
		}
		return false;
	}

}
