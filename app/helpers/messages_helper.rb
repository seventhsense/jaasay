module MessagesHelper
  def aa_adaptor(aa, message)
    aa.gsub(/\[\[message\]\]/, message).gsub(/\n/,"<br>").html_safe
  end
end
