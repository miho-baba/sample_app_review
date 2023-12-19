class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    # if式を用いて、対象のカラムにデータが入力されていればsaveメソッドでtrueが返す。
    if @list.save
      # 次に表示したいページにリダイレクトさせる。
      redirect_to list_path(@list.id)
    # 対象のカラムにデータが入力されていなければ、saveメソッドでfalseが返す。
    else
      # falseならば、新規投稿ページを再表示するように設定
      @lists = List.all
      render :index
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update # 編集機能の更新の記述
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def destroy
    list = List.find(params[:id]) # データ（レコード）を１件取得
    list.destroy # データ（レコード）を削除
    redirect_to '/lists' # 投稿一覧画面へリダイレクト
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
