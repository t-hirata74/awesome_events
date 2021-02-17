class EventSearchForm
  include ActiveModel::Model # モデルとして必要な振る舞いになる
  include ActiveModel::Attributes # attributeメソッドを使用し、セッターとゲッターを定義

  attribute :keyword, :string
  attribute :page, :integer

  def search
    # searchkickで検索するメソッド
    Event.search(
      keyword_for_search,
      where: { start_at: {gt: start_at }},
      page: page,
      per_page: 10
    )
  end

  def start_at
    @start_at || Time.current
  end

  def start_at=(new_start_at)
    @start_at = new_start_at.in_time_zone
  end

  private

  def keyword_for_search
    keyword.presence || "*"
  end
end