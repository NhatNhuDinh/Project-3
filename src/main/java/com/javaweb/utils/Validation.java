package com.javaweb.utils;

public class Validation {

	public static boolean isString(String str) {
		if (str == null  || str.isEmpty()) {
			return false;
		} else {
			return true;
		}
	}

	public static boolean isNumber(String str) {
		for (char x : str.toCharArray()) {
			if (!Character.isDigit(x)) {
				return false;
			}
		}
		return true;
	}

	public static Long getValidNumber(String str) {
		Long number = Long.parseLong(str.trim());
		return number;
	}

}
