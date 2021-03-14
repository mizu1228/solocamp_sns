module TweetsHelper
  def render_with_tags(text)
    text.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/){|word| link_to word, "/tweet/tag/#{word.delete("#＃")}"}.html_safe
  end
end
