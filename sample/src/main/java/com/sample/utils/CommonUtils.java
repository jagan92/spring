package com.sample.utils;

import com.sample.constants.AppConstants;
import com.sample.entity.base.BaseEntity;

public class CommonUtils {
	
	
	private CommonUtils() {
	    // Avoid Instantiation.
	  }
	
	public static boolean isNameAlreadyExists(boolean isNew, BaseEntity dbBaseEntity, BaseEntity newBaseEntity) {
	    boolean isDuplicate = false;
	    if (dbBaseEntity != null) {
	      if (isNew) {
	        isDuplicate = true;
	      } else if (dbBaseEntity.getId().longValue() != newBaseEntity.getId()) {
	        isDuplicate = true;
	      }
	    }
	    return isDuplicate;
	  }
	
	
	public static String getSoftDeletedName(String name, int maxLength) {
	    Long timestmp = System.currentTimeMillis();
	    StringBuilder sb = new StringBuilder(name);
	    String suffix = AppConstants.UNDER_SCORE_SEPARATOR + String.valueOf(timestmp);
	    if (name.length() + suffix.length() > maxLength) {
	      sb.replace(maxLength - suffix.length(), maxLength, suffix);
	    } else {
	      sb.append(suffix);
	    }
	    return sb.toString();
	  }

}
