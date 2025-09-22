# config/breadcrumbs.rb

crumb :root do
  link "トップ", root_path
end

crumb :mypage do
  link "マイページ", mypage_path
  parent :root
end

crumb :achievements do
  link "実績確認", achievements_path
  parent :mypage
end

crumb :carebit_select do
  link "Carebit選択", carebit_select_path
  parent :mypage
end
