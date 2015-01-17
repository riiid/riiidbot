# Description:
#   Allows Hubot to search edu app rank.
#
# Commands:
#   hubot rank <query>
#
# Author:
#   importre

result = null
doing = false
today = null

module.exports = (robot) ->
  robot.respond /rank[ \t]+(.+)/i, (msg) ->
    query = msg.match[1]
    re = /<a class="title"[^>]+>\s*(\d+\.\s*([^><])+)</gi
    if doing
      msg.send "I'm crawling..."
      return

    now = new Date().pretty()
    if result is null and not doing and today isnt now
      msg.send "I'm on it, Boss."
      today = now
      crawl(msg, re, 0, 100, 500, query)
    else
      msg.send "I've just found in today results."
      search(msg, query)

crawl = (msg, re, start, num, end, query) ->
  doing = true
  url = "https://play.google.com/store/apps/category/EDUCATION/collection/topselling_free?start=#{start}&num=#{num}"
  msg.send "crawling in #{start}...#{start + num}"
  msg.http(url)
    .header('Content-Type', 'application/x-www-form-urlencoded')
    .header('User-Agent', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36')
    .get() (err, res, body) ->
      if err
        msg.send "Encountered an error :( #{err}"
        return
      res = (res[1].trim() while (res = re.exec(body)) isnt null)
      out = res.join('\n')
      result += out + '\n'
      if start + num < end
        crawl(msg, re, start + 100, num, end, query)
      else
        search(msg, query)
        doing = false

search = (msg, query) ->
  re = new RegExp("(^\\d+\.[ \\t]+.*?#{query}.*)", "igm")
  res = (res[0] while (res = re.exec(result)) isnt null)
  out = res.join('\n')
  msg.send out

zeropad = (x) ->
  if x < 10 then '0' + x else '' + x

Date::pretty = ->
  d = zeropad(this.getDate())
  m = zeropad(this.getMonth() + 1)
  y = this.getFullYear()
  y + m + d
