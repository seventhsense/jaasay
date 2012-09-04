#encoding: utf-8
require 'csv'
前提 /^次の"(.*?)"レコードがある$/ do |factory, table|
  table.hashes.each do |hash|
    FactoryGirl.create(factory, hash)
  end 
end

前提 /^"(.*?)"ページを表示している$/ do |addr|
  visit addr
end

前提 /^csvfile"(.*?)"から"(.*?)"レコードを読み取る$/ do |csv_file, factory|
  CSV.foreach(File.dirname(__FILE__)+"/"+csv_file,{:headers => :first_row,:return_headers => true}) do |row| 
    hash = Hash.new
    row.headers().each do |header|
      hash[header] = row[header]
    end
    FactoryGirl.create(factory, hash)
  end
end

もし /^"(.*?)"ページを表示する$/ do |addr|
  visit addr
end

もし /^"(.*?)"に"(.*?)"と入力する$/ do |label, description|
  fill_in label, with: description
end

もし /^\$\("(.*?)"\)要素内のテキストフォームに"(.*?)"と入力する$/ do |css, text|
  within(css) do
    fill_in('text', :with => text)
  end

end

もし /^"(.*?)"リンクをクリックする$/ do |link|
  click_link link
end

もし /^"(.*?)"ボタンをクリックする$/ do |link|
  click_button link
end

もし /^\$\("(.*?)"\)要素内の"(.*?)"リンクをクリックする$/ do |css, link|
  within(css) do
    click_link link
  end
end

もし /^\$\("(.*?)"\)CSS要素をもつ"(.*?)"というテキストを探して、リンクをクリックする$/ do |css, link|
  find(css,text: link).click
end

ならば /^"(.*?)"ページを表示していること$/ do |path|
  current_path.should == path
end

ならば /^"(.*?)"と表示されていること$/ do |content|
  page.should have_content content
end

ならば /^"(.*?)"と表示されていないこと$/ do |content|
  page.has_no_content? content
end

ならば /^\$\("(.*?)"\)CSS要素を含むこと$/ do |css|
  page.should have_css css
end

ならば /^\$\("(.*?)"\)CSS要素に"(.*?)"と表示されていること$/ do |css, content|
  find(css).should have_content(content)
end


ならば /^\$\("(.*?)"\)CSS要素に"(.*?)"と表示されていないこと$/ do |css, content|
  find(css).should have_no_content(content)
end

ならば /^\$\("(.*?)"\)CSS要素内に"(.*?)"というリンクが表示されていること$/ do |css, link|
  within(css) do
    find(link).visible?
  end
end

ならば /^\$\("(.*?)"\)CSS要素を探して、"(.*?)"というリンクを探して、表示されていること$/ do |css, link|
  find(css).find_link(link).visible?
end

ならば /^\$\("(.*?)"\)CSS要素をもつ"(.*?)"というテキストを探して、表示されていること$/ do |css, link|
  find(css,text: link).visible?
end

ならば /^次のとおり表示されていること$/ do |table|
  # table is a Cucumber::Ast::Table
  condition = ""
  table.raw.each do |row|
     eachRow = row.join(".*?")
     condition += eachRow + ".*?" 
  end
  page.should have_content /#{condition}/ 
end

ならば /^次のとおり表示されていないこと$/ do |table|
  # table is a Cucumber::Ast::Table
  condition = ""
  table.raw.each do |row|
     eachRow = row.join(".*?")
     condition += eachRow + ".*?" 
  end
  page.should have_no_content /#{condition}/ 
end
