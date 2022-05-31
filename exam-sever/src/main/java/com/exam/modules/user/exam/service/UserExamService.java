package com.exam.modules.user.exam.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.exam.core.api.dto.PagingReqDTO;
import com.exam.modules.user.exam.dto.request.UserExamReqDTO;
import com.exam.modules.user.exam.dto.response.UserExamRespDTO;
import com.exam.modules.user.exam.entity.UserExam;

/**
* <p>
* 考试记录业务类
* </p>
*
* @author 聪明笨狗
* @since 2020-09-21 15:13
*/
public interface UserExamService extends IService<UserExam> {

    /**
    * 分页查询数据
    * @param reqDTO
    * @return
    */
    IPage<UserExamRespDTO> paging(PagingReqDTO<UserExamReqDTO> reqDTO);

    /**
     * 分页查询数据
     * @param reqDTO
     * @return
     */
    IPage<UserExamRespDTO> myPaging(PagingReqDTO<UserExamReqDTO> reqDTO);


    /**
     * 考试完成后加入成绩
     * @param userId
     * @param examId
     * @param score
     * @param passed
     */
    void joinResult(String userId, String examId, Integer score, boolean passed);
}
