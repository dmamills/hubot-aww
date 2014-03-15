# Description:
#  AWEEEEEEEE
#
# Commands:
#  hubot aww - Get something adorable to look at
#

aww_url = 'http://www.reddit.com/r/aww/.json'

module.exports = (robot) ->
  robot.respond /aww/, (msg) ->
    msg.http(aww_url)
    .get() (err,res,body) ->
      posts = JSON.parse(body).data.children
      images = []
      for post in posts
        if post.data.url?
          images.push post.data.url

      msg.send msg.random images
