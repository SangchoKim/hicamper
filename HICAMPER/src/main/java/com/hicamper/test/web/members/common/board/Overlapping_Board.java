package com.hicamper.test.web.members.common.board;

import java.util.Map;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.hicamper.test.web.members.common.CommonExceptionHandler;

@Transactional(readOnly = true)
@Repository
public class Overlapping_Board {

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int overlap_2(int count){

		if (count == 1) {
			System.out.println("Success");
		} else {
			System.out.println("Fail");
		}
		return count;
	}


}
