package com.sample.constants;

import org.springframework.data.domain.Sort;

public final class AppConstants {

	public static final char YES = 'Y';
	public static final char NO = 'N';
	public static final String EMPTY_STRING = "";
	public static final String UTF8 = "UTF-8";
	public static final String UNDER_SCORE_SEPARATOR = "_";
	public static final String PIPE_SEPARATOR = "|";
	public static final String HYPEN_SEPARATOR = "-";

	public static final String TOOLTIP_ADD = "Add";
	public static final String TOOLTIP_EDIT = "Edit";
	public static final String TOOLTIP_DELETE = "Delete";
	public static final String TOOLTIP_SUB_ITEMS_CONFIG = "Congifure Sub Items";
	public static final String ORDER = "Order";

	public static final String SORT_PREF_ASC = "Asc";
	public static final String SORT_PREF_DESC = "Desc";
	public static final String DATA_TYPE_TEXT = "Text";
	public static final String LOGIN_USER = "loginUser";
	public static final String LOG_USER_ROLE = "logUserRole";
	public static final String APP_TYPE = "appType";
	public static final String USER_TYPE = "User Type";
	public static final String PUPIL_RECORD_STATUS = "Pupil Record Status";
	public static final String ORDER_STATUS = "Order Status";
	public static final String SALES_PERSON = "Sales Person";

	public static final String UI_MESSAGE = "message";
	public static final String UI_ERROR = "error";
	public static final String UI_ALERT_TITLE = "title";
	public static final String APP_FORM_INPUT_CSS = "application.form.input.css";
	public static final String APP_FORM_TABLE_CSS = "application.form.table.class";
	public static final String FORM_INPUT_CSS = "formInputCss";
	public static final String FORM_TABLE_CSS = "formTableCss";
	public static final String RESET_PWD_SUCCESS = "passwordreset";
	public static final String MSG_USER_NOT_FOUND = "Your account is not valid!";
	public static final String DATA_UPDATED = "Data updated successfully!";
	public static final String DATA_DELETED = "Data deleted successfully!";

	public static final String ATTR_PROXY_URL = "proxyUrl";
	
	public static final String NAME_ALREADY_EXISTS = "Name already exists! Choose a unique name.";
	public static final Sort SEQ_NO_ORDER_BY_ASC = new Sort(Sort.Direction.ASC, "seqNo");
	public static final Sort NAME_ORDER_BY_ASC = new Sort(Sort.Direction.ASC, "name");

}
