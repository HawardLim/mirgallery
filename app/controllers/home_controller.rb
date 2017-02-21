class HomeController < ApplicationController
  def index
  end
  def news
    @news = New.paginate(:page => params[:page], per_page: 12).order('created_at DESC')
  end
  def admin_news
    @news = New.paginate(:page => params[:page], per_page: 12).order('created_at DESC')
  end
  def admin_main 
    @main = Main.paginate(:page => params[:page], per_page: 12).order('created_at DESC')
  end
  def news_detail
    @news = New.find(params[:id])
    @news.increment('count')
    @news.save
  end 
  def main_upload
    @event = Mainpic.new
    file1 = params[:pic1]
    @uploader1 = DispatchUploader.new
    @uploader1.store!(file1)
    @event.pic1 = @uploader1.url
    file2 = params[:pic2]
    @uploader2 = DispatchUploader.new
    @uploader2.store!(file2)
    @event.pic2 = @uploader2.url
    file3 = params[:pic3]
    @uploader3 = DispatchUploader.new
    @uploader3.store!(file3)
    @event.pic3 = @uploader3.url
    file4 = params[:pic4]
    @uploader4 = DispatchUploader.new
    @uploader4.store!(file4)
    @event.pic4 = @uploader4.url
    file5 = params[:pic5]
    @uploader5 = DispatchUploader.new
    @uploader5.store!(file5)
    @event.pic5 = @uploader5.url
    file6 = params[:pic6]
    @uploader6 = DispatchUploader.new
    @uploader6.store!(file6)
    @event.pic6 = @uploader6.url
    @event.save
  end
  def artist_upload
    @event = Artist.new
    @event.name = params[:name]
    @event.name_c = params[:name_c]
    @event.bio = params[:bio]
    @event.bio_c = params[:bio_c]
    file = params[:pic]
    @uploader = DispatchUploader.new
    @uploader.store!(file)
    @event.title_pic = @uploader.url
    @event.save
    redirect_to "/home/artist_detail/#{@event.id}"
  end
  def artist_edit_com
    @event = Artist.find(params[:id])
    @event.name = params[:name]
    @event.name_c = params[:name_c]
    @event.bio = params[:bio]
    @event.bio_c = params[:bio_c]
    @event.save
    redirect_to "/home/artist_detail/#{@event.id}"
  end
  def news_upload
    @news = New.new
    @news.title = params[:title]
    @news.title_c = params[:title_c]
    @news.content = params[:content]
    @news.content_c = params[:content_c]
    file = params[:pic]
    @uploader = DispatchUploader.new
    @uploader.store!(file)
    @news.news_pic = @uploader.url
    @news.save
    redirect_to "/home/admin_news"
  end
  def news_edit_com
    @news = New.find(params[:id])
    @news.title = params[:title]
    @news.title_c = params[:title_c]
    @news.content = params[:content]
    @news.content_c = params[:content_c]
    @news.save
   redirect_to "/home/admin_news"
  end
  def exhi_upload
    @event = Exhibition.new
    @event.condition = params[:condition]
    @event.name = params[:name]
    @event.name_c = params[:name_c]
    @event.content = params[:content]
    @event.content_c = params[:content_c]
    @event.period_sta = params[:period_sta]
    @event.period_end = params[:period_end]
    file = params[:title_pic]
    @uploader = DispatchUploader.new
    @uploader.store!(file)
    @event.title_pic = @uploader.url
    @event.save
    redirect_to "/home/exhibition_detail/#{@event.id}"
  end
  def exhi_edit_com
    @event = Exhibition.find(params[:id])
    @event.condition = params[:condition]
    @event.name = params[:name]
    @event.name_c = params[:name_c]
    @event.content = params[:content]
    @event.content_c = params[:content_c]
    @event.period_sta = params[:period_sta]
    @event.period_end = params[:period_end]
    @event.save
    redirect_to "/home/exhibition_detail/#{@event.id}"
  end
  def art_upload
    @event = Art.new
    @artist = Artist.find(params[:artist_id])
    @event.title = params[:title]
    @event.title_c = params[:title_c]
    @event.name = params[:name]
    @event.name_c = params[:name_c]
    @event.year = params[:year]
    @event.size = params[:size]
    @event.artist_id = params[:artist_id]
    @event.material = params[:material]
    file = params[:pic]
    @uploader = DispatchUploader.new
    @uploader.store!(file)
    @event.pic = @uploader.url
    @event.save
    redirect_to "/home/artist_detail/#{@artist.id}"
  end
  def art_edit_com
    @event = Art.find(params[:id])
    @event.title = params[:title]
    @event.title_c = params[:title_c]
    @event.name = params[:name]
    @event.name_c = params[:name_c]
    @event.year = params[:year]
    @event.size = params[:size]
    @event.material = params[:material]
    @event.save
    redirect_to "/home/artist_detail/#{@artist.id}"
  end
  def exhi_attachment_edit_com
    @event = Exhiattachment.find(params[:id])
    @event.title = params[:title]
    @event.title_c = params[:title_c]
    @event.content = params[:content]
    @event.content_c = params[:content_c]
    @event.save
    redirect_to "/home/exhi_attachment_detail/#{@event.id}"
  end 
  def admin_artist 
    @artist = Artist.paginate(:page => params[:page], per_page: 10).order('created_at DESC')
  end 
  def admin_exhibition 
    @exhi = Exhibition.paginate(:page => params[:page], per_page: 10).order('created_at DESC')
  end 
  def artist_destroy
    @bigmain = Artist.find(params[:id])
    @bigmain.destroy
    redirect_to "/home/admin_artist"
  end
  def artist_detail 
    @artist = Artist.find(params[:id])
    @artist_art = @artist.arts.paginate(:page => params[:page], per_page: 12).order('created_at DESC')
    @artist_exhi = @artist.exhis
  end
  def artist 
    @artist = Artist.paginate(:page => params[:page], per_page: 12).order('created_at DESC')
  end
  def art_write
    @artist = Artist.find(params[:id])
  end 
  def art_detail
    @art = Art.find(params[:id])
  end
  def exhibition
    @exhi = Exhibition.paginate(:page => params[:page], per_page: 12).order('created_at DESC')
  end
  def exhibition_current
    @exhi = Exhibition.where("condition = 'current'").paginate(:page => params[:page], per_page: 12).order('created_at DESC')
  end
  def exhibition_upcoming
    @exhi = Exhibition.where("condition = 'upcoming'").paginate(:page => params[:page], per_page: 12).order('created_at DESC')
  end
  def exhibition_past
    @exhi = Exhibition.where("condition = 'past'").paginate(:page => params[:page], per_page: 12).order('created_at DESC')
  end
  def exhibition_detail
    @exhi = Exhibition.find(params[:id])
    @exhi_art = @exhi.exhiattachments.paginate(:page => params[:page], per_page: 12).order('created_at DESC')
  end
  def exhi_attachment_write 
    @exhi = Exhibition.find(params[:id])
  end 
  def exhi_attachment_upload
    @event = Exhiattachment.new
    @event.exhibition_id = params[:exhibition_id]
    @event.title = params[:title]
    @event.title_c = params[:title_c]
    @event.content = params[:content]
    @event.content_c = params[:content_c]
    file = params[:pic]
    @uploader = DispatchUploader.new
    @uploader.store!(file)
    @event.pic = @uploader.url
    @event.save
    redirect_to "/home/exhi_attachment_detail/#{@event.id}"
  end 
  def exhi_attachment_detail
    @attach = Exhiattachment.find(params[:id])
    @exhi = @attach.exhibition
  end
  def art_destroy
        @gongmos = Art.find(params[:id])
        @gongmos.destroy
        redirect_to "/home/admin_artist"
  end
  def art_edit
        @gongmos = Art.find(params[:id])
  end
  def artist_destroy
        @gongmos = Artist.find(params[:id])
        @gongmos.destroy
        redirect_to "/home/admin_artist"
  end
  def artist_edit
        @gongmos = Artist.find(params[:id])
  end
  def exhi_destroy
        @gongmos = Exhibition.find(params[:id])
        @gongmos.destroy
        redirect_to "/home/admin_exhibition"
  end
  def exhi_edit
        @gongmos = Exhibition.find(params[:id])
  end
  def exhi_attachment_destroy
        @gongmos = Exhiattachment.find(params[:id])
        @gongmos.destroy
        redirect_to "/home/admin_exhibition"
  end
  def exhi_attachment_edit
        @gongmos = Exhiattachment.find(params[:id])
  end
  def news_destroy
        @gongmos = New.find(params[:id])
        @gongmos.destroy
        redirect_to "/home/admin_news"
  end
  def news_edit
        @gongmos = New.find(params[:id])
  end
end
