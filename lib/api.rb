require 'mechanize'
module Bleeping
  class << self
    public
    Address = "https://bleepingcomputer.com"
    Agent   = Mechanize.new
    Page    = Agent.get(Address)
    def Option(num)
        if num.nil? or num < 1
            link  = Page.at("#bc-home-news-main-wrap > li:nth-child(1) > div.bc_latest_news_text > h4 > a")
            return link
        else
            link  = Page.at("#bc-home-news-main-wrap > li:nth-child("+num.to_s+") > div.bc_latest_news_text > h4 > a")
            return link
        end
    end
    def get(*args)
        # Get title/link at any place
    	num     = args.shift
        results = Option(num)
        return results[:href], results.text
    end
    def Title(*args)
        # Just get title
        num     = args.shift
        results = Option(num)
        return results.text
    end
    def Link(*args)
        # Just get link
        num     = args.shift
        results = Option(num)
        return results[:href]
    end
    def Date(*args)
        num  = args.shift
        if num.nil? or num < 1
            link  = Page.at("#bc-home-news-main-wrap > li:nth-child(1) > div.bc_latest_news_text > ul > li.bc_news_date")
            return link
        else
            link  = Page.at("#bc-home-news-main-wrap > li:nth-child("+num.to_s+") > div.bc_latest_news_text > ul > li.bc_news_date")
            return link.text
        end
    end
    def Time(*args)
        num = args.shift
        if num.nil? or num < 1
            link = Page.at("#bc-home-news-main-wrap > li:nth-child(1) > div.bc_latest_news_text > ul > li.bc_news_time")
            return link.text
        else
            link = Page.at("#bc-home-news-main-wrap > li:nth-child("+num.to_s+") > div.bc_latest_news_text > ul > li.bc_news_time")
            return link.text
        end
    end
    def Author(*args)
        num = args.shift
        if num.nil? or num < 1
            link = Page.at("#bc-home-news-main-wrap > li:nth-child(1) > div.bc_latest_news_text > ul > li.bc_news_author > a")
        else
            link = Page.at("#bc-home-news-main-wrap > li:nth-child("+num.to_s+") > div.bc_latest_news_text > ul > li.bc_news_author > a")
            return link.text
        end
    end
    def Summary(*args)
        num = args.shift
        if num.nil? or num < 1
            summary = Page.at("#bc-home-news-main-wrap > li:nth-child(1) > div.bc_latest_news_text > p")
            return summary.text
        else
            summary = Page.at("#bc-home-news-main-wrap > li:nth-child("+num.to_s+") > div.bc_latest_news_text > p")
            return summary.text
        end
    end
    def BleepingComputer(*args)
        num = args.shift
        a = Hash["Title" => get(num)[1], "Link" => get(num)[0], "Date" => Date(num), "Time" => Time(num), "Author" => Author(num), "Summary" => Summary(num)]
        return a
    end
  end
end
