class PDFKit
  class Source
    def initialize(source)
      @source = source
    end
    
    def url?
      @source.is_a?(String) && @source.match(/\Ahttp/)
    end
    
    def file?
      @source.kind_of?(File)
    end
    
    def document_objects?
      @source.is_a? Array
    end

    def html?
      !(url? || file? || document_objects?)
    end
    
    def to_s
      file? ? @source.path : @source
    end

    def to_args
      if document_objects?
        @source.map(&:to_a).flatten.map(&:to_s)
      else
        [to_s]
      end
    end
  end
end
