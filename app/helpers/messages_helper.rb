module MessagesHelper
  def aa_adaptor(aa, message)
    aa.gsub(/\[\[message\]\]/, "<span class=\"message\">#{ message }</span>").gsub(/\n/,"<br>").html_safe
  end
end
