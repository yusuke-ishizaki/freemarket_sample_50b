crumb :root do
  link 'メルカリ', root_path
end

    #users/show
crumb :mypage do |user|
  link 'マイページ', users_show_123_path
  parent :root
end

    #users/index
crumb :show_user do |user|
  link "プロフィール", users_path
  parent :mypage
end

    #users/logout
crumb :logout_user do |user|
  link "ログアウト", logout_path
  parent :mypage
end

    #users/personal_info
crumb :edit_user do |user|
  link "本人情報の登録", user
  parent :mypage
end

    #product/product_status
crumb :puroduct_status do |product|
  link "出品した商品 - 出品中", product_status_path
  parent :mypage
end

crumb :product do |product|
  link product.name, product_path(product)
  parent :root
end

    #card/index
crumb :card do |user|
  link '支払い方法', cards_card_index_path
  parent :mypage
end

    #card/new
crumb :card_new do |user|
  link 'クレジットカード情報入力', user
  parent :card
end

    #categories/index
crumb :category do |category|
  link 'カテゴリー一覧'
  parent :root
end

crumb :brands do
  link 'ブランド一覧', brand_path
  parent :root
end
# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
