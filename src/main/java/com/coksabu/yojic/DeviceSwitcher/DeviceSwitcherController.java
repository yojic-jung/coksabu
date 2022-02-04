package com.coksabu.yojic.DeviceSwitcher;
import org.springframework.mobile.device.Device;


import org.springframework.mobile.device.DeviceUtils;
import org.springframework.web.context.request.RequestContextHolder;

abstract public class DeviceSwitcherController {
	protected String forward(String viewName) {
		Device device = DeviceUtils.getCurrentDevice(RequestContextHolder.currentRequestAttributes());
		if (device.isMobile()) {
			return  viewName+".mobile";
		}
		return viewName;
	}

	protected String redirect(String redirectPath) {
		return "redirect:" + redirectPath;
	}
}
