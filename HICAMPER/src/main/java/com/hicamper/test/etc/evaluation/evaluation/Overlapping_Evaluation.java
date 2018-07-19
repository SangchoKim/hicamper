package com.hicamper.test.etc.evaluation.evaluation;



import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Transactional(readOnly = true)
@Repository
public class Overlapping_Evaluation {

	public int overlap_2(int count) {

		if (count == 1) {
			System.out.println("Success");
		} else {
			System.out.println("Fail");
		}
		return count;
	}

}
