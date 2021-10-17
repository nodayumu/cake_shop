ER図・テーブル定義書・詳細設計


boolean型は接頭辞にis_を付けることが多い。 yes/noで見分けられるものだから。
is_形容詞    (例) t.boolean :is_active, default: true, null: false


数値型は先頭に0を置けない。つまり、住所とか郵便番号は integerはダメ。stringが適切。


商品 → 税率が変わったときに臨機応変に対応できるように税抜き価格。
注文商品 → 注文後に税率が変わっても、支払金額が変わらないようにしたいから税込み価格。




認証機能・アカウント管理機能


deviseを使用して管理者と会員それぞれのコントローラーを作成
rails g devise:controllers end_users
rails g devise:controllers admins
今回は管理者が一人と想定して"admin"(単数形)で作成

https://nllllll.com/ruby-on-rails/rails-devise/

https://note.com/yukinooffice/n/n5f9f8da40801



deviseの日本語化

https://qiita.com/k19911848/items/8ed4225e9a99beb9b901



railsのroutes.rbのmemberとcollectionの違い

・memberは特定のデータにアクションを利用する
・collectionは全体のデータにアクションを利用する

簡単に言うと・・・
memberはshow
collectionはindex
という感じ。routingにidが付くか付かないかの違い。

(例) 顧客の退会確認画面　アクション名 quit_confirm の場合

  resources :end_users do
    member do
      get :quit_confirm
    end
  end

https://qiita.com/k152744/items/141345e34fc0095217fe

https://www.javadrive.jp/rails/routing/index6.html



namespaceとscope moduleでの違い

namespaceとscope moduleではprefix(〇〇_pathのメソッド名)のほかURIが異なる。
namespace :admin とするとURIも/admin/hogehogeと頭に/adminが付く。
一方、scope module: :adminとしてもURIは/hogehogeとなり/adminは付かない！！

コントローラーのパス、ディレクトリ名とURLを一致させたいときは namespace が便利

基本的には管理者と一般ユーザーで分けることがほとんどなので、controllersフォルダ直下にadminsフォルダとend_usersフォルダの2種類のディレクトリが必要
→ namespaceが最も適切となる
※ 一般ユーザー(エンドユーザ)のそれぞれのページは、URLにpublicは付かないようにしたいからnamespaceやscope moduleの記述は不必要となる。そのため、publicフォルダは作成していない。

https://cre8cre8.com/rails/resources-namespace-scope-routes.rb.htm

https://qiita.com/ryosuketter/items/9240d8c2561b5989f049




カート・注文機能


フォーム内のプルダウン表記でステータスを変更できるようにする
mapメソッド　enum使用

https://qiita.com/__Wata16__/items/9b6fe33f705dac6e5319

https://haayaaa.hatenablog.com/entry/2019/02/20/212805



追加した商品がカート内に存在するかの判別
if current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?

def create
# 1. 追加した商品がカート内に存在するかの判別
    # 存在した場合
        # 2. カート内の個数をフォームから送られた個数分追加する
    # 存在しなかった場合
        # カートモデルにレコードを新規作成する
end



nil? empty? blank? present? の使い分け

https://qiita.com/somewhatgood@github/items/b74107480ee3821784e6



数値を3桁で区切るdelimitedメソッド(今回は使用しない)

https://qiita.com/syohhe/items/1a8502e143ed273cfa23



ordersテーブルに外部キーaddress_idを持たせる場合

orders_controller.rb（コントローラー）comfirmアクション
@address = Address.find_by(id: params[:order][:address_id])

orders/new.html.erb（ビュー）
<%= f.collection_select :address_id, current_end_user.addresses, :id, :full_address, include_blank: "選択して下さい" %>


持たせない場合

orders_controller.rb（コントローラー）comfirmアクション
@address = Address.find_by(id: params[:address][:id])　　※[:id]のidはメソッド

orders/new.html.erb（ビュー）
<%= collection_select :address, :id, current_end_user.addresses, :id, :full_address, include_blank: "選択して下さい" %>


f.でフォームと紐づけてしまうとパラメーターのところで引っかかってしまうためcollection_selectを単体で置く
collection_select ：オブジェクト名(address)，：メソッド名(id)　・・・

https://qiita.com/jackie0922youhei/items/e83d67d521ab10a86f23




検索機能・ジャンル検索機能


form_for・・・ modelに基づいたformを作成する
form_tag・・・modelに基づかないformを作成する

検索フォームの実装はform_tag
text_field_tagはform_tagとセットで使うことが多い

https://www.for-engineer.life/entry/rails-search-form/



商品画面一覧のジャンル名をクリックすると、商品画面一覧にそのジャンルの商品だけが表示されるようにする方法

<%= link_to item.genre.name, items_path(:search_key => item.genre_id) %>

hoge_path(:キー => "値")
itemモデルのFKであるgenre_idカラムは整数型(integer)のため、ダブルクォーテーションは不要

resourcesメソッドのindex(一覧)であっても、この記述方法であれば引数取ること可能

https://qiita.com/ATORA1992/items/566d76a7092bff40df4c