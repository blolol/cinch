require 'helper'

class ChannelTest < TestCase
  FakeIRC = Struct.new(:sent) do
    def send(msg)
      sent << msg
    end
  end

  def setup
    config = Struct.new(:message_split_start, :message_split_end, :max_messages).new
    @irc = FakeIRC.new([])
    bot = Struct.new(:config, :irc, :mask).new(config, @irc, 'cinch!~cinch@example.com')
    @channel = Cinch::Channel.new('#cinch', bot)
  end

  test 'send should send a PRIVMSG' do
    @channel.send('Hello world!')
    assert_equal(['PRIVMSG #cinch :Hello world!'], @irc.sent)
  end

  test 'send should send a RELAYMSG when given as:' do
    @channel.send('Hello world!', as: 'relayed')
    assert_equal(['RELAYMSG #cinch relayed :Hello world!'], @irc.sent)
  end

  test 'safe_send should send the sanitized text' do
    @channel.safe_send("Hello\x01 world!")
    assert_equal(['PRIVMSG #cinch :Hello world!'], @irc.sent)
  end
end
