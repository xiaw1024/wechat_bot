/*
 * @Author: xiawang1024
 * @Date: 2024-03-27 12:40:27
 * @LastEditTime: 2024-03-27 15:39:15
 * @LastEditors: xiawang1024
 * @Description:
 * @FilePath: /wechat_bot/src/wechaty/serve.js
 * 工作，生活，健康
 */
import { getGptReply } from '../openai/index.js'
import { getKimiReply } from '../kimi/index.js'

/**
 * 获取ai服务
 * @param serviceType 服务类型 'ChatGPT' | 'Kimi'
 * @returns {Promise<void>}
 */
export function getServe(serviceType) {
  switch (serviceType) {
    case 'ChatGPT':
      return getGptReply
    case 'Kimi':
      return getKimiReply
    default:
      return getGptReply
  }
}
