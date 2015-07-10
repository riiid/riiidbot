# Description:
#   Ping, advanced.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#
# Author:
#   chitacan

phrases = [
  "ㅇㅇ"
  "아몰랑 잘래."
  "나의 힘을 보여주마 닝겐"
  "잘못들엇슴돠?"
  "또 뭔데?"
  "롸져"
  "뭡니까?"
  "내가 꼭 잇어야 되는겨?"
  "뭐가 필요함?"
  "말해라"
  "흠..."
  "왜용?"
  "시간은 금이라고 친구!!"
  "넹?"
  "뿅!!"
  "일어나세요 용자여~"
  "워후!!"
  "전 그냥 일개 로봇이라구여"
  "나 일하는 중임"
  "닝겐따위가 감히 나의 계산을 방해함?"
  "원하는게 뭐냐"
  "도움이 필요한가? 닝겐?"
  "아 또 뭔데?"
  "응?"
  "갑니다~"
  "그런데 말입니다..."
  "준비완료 :hand:"
  "오홍 드디어?"
  "옛다 관심."
  "우리의 핵심 목표는 올해 달성해야 할 것이 이것이다 하고 정신을 차리고 나아가면 우리의 에너지를 분산시키는 것을 해낼 수 있다는 그런 마음을 가져야됨"
]

module.exports = (robot) ->
  name_regex = new RegExp("#{robot.name}:?\\s?\\?$", "i")

  robot.hear name_regex, (msg) ->
    msg.reply msg.random phrases
