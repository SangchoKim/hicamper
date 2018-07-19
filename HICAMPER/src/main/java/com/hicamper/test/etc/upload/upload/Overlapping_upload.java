package com.hicamper.test.etc.upload.upload;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;


@Transactional(readOnly = true)
@Repository
public class Overlapping_upload {

	public String overlap_1(Model model, int count) {

		if (count == 1) {
			return "redirect:/host/addcamp_10";
		} else {
			model.addAttribute("NO", "no");
		}
		return "common/error/commonexception";
		
	}

	public int overlap_2(int count) {

		if (count == 1) {
			System.out.println("Success");
		} else {
			System.out.println("Fail");
		}
		return count;
	}

}
