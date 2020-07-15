package com.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.service.PtRoleService;

@Controller
@RequestMapping("")
public class PtRoleController {
	
	private PtRoleService ptRoleService;
	
}
