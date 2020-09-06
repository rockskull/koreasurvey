package kr.quantumsoft.koreasurvey.utils;

import kr.quantumsoft.koreasurvey.model.Users;
import org.springframework.security.core.Authentication;

public class SpringSecurityUtil {
    public static Users getUserFromAuth(Authentication auth) {
        if (auth == null) {
            return null;
        }
        if (auth.getAuthorities() == null) {
            return null;
        }
        return (Users) auth.getPrincipal();
    }

}
