module Pango
  # A `PangoGlyphItemIter` is an iterator over the clusters in a
  # `PangoGlyphItem`.
  #
  # The *forward direction* of the iterator is the logical direction of text.
  # That is, with increasing @start_index and @start_char values. If @glyph_item
  # is right-to-left (that is, if `glyph_item->item->analysis.level` is odd),
  # then @start_glyph decreases as the iterator moves forward.  Moreover,
  # in right-to-left cases, @start_glyph is greater than @end_glyph.
  #
  # An iterator should be initialized using either
  # pango_glyph_item_iter_init_start() or
  # pango_glyph_item_iter_init_end(), for forward and backward iteration
  # respectively, and walked over using any desired mixture of
  # pango_glyph_item_iter_next_cluster() and
  # pango_glyph_item_iter_prev_cluster().
  #
  # A common idiom for doing a forward iteration over the clusters is:
  #
  # ```
  # PangoGlyphItemIter cluster_iter;
  # gboolean have_cluster;
  #
  # for (have_cluster = pango_glyph_item_iter_init_start (&cluster_iter,
  #                                                       glyph_item, text);
  #      have_cluster;
  #      have_cluster = pango_glyph_item_iter_next_cluster (&cluster_iter))
  # {
  #   ...
  # }
  # ```
  #
  # Note that @text is the start of the text for layout, which is then
  # indexed by `glyph_item->item->offset` to get to the text of @glyph_item.
  # The @start_index and @end_index values can directly index into @text. The
  # @start_glyph, @end_glyph, @start_char, and @end_char values however are
  # zero-based for the @glyph_item.  For each cluster, the item pointed at by
  # the start variables is included in the cluster while the one pointed at by
  # end variables is not.
  #
  # None of the members of a `PangoGlyphItemIter` should be modified manually.
  class GlyphItemIter
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibPango::GlyphItemIter))
      @pointer.copy_from(pointer, sizeof(LibPango::GlyphItemIter))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(glyph_item : Pango::GlyphItem? = nil, text : ::String? = nil, start_glyph : Int32? = nil, start_index : Int32? = nil, start_char : Int32? = nil, end_glyph : Int32? = nil, end_index : Int32? = nil, end_char : Int32? = nil)
      _ptr = Pointer(Void).malloc(40)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.glyph_item = glyph_item unless glyph_item.nil?
      _instance.text = text unless text.nil?
      _instance.start_glyph = start_glyph unless start_glyph.nil?
      _instance.start_index = start_index unless start_index.nil?
      _instance.start_char = start_char unless start_char.nil?
      _instance.end_glyph = end_glyph unless end_glyph.nil?
      _instance.end_index = end_index unless end_index.nil?
      _instance.end_char = end_char unless end_char.nil?
      _instance
    end

    def finalize
    end

    def glyph_item : Pango::GlyphItem
      # Property getter
      _var = (@pointer + 0).as(Pointer(Pointer(LibPango::GlyphItem)))
      Pango::GlyphItem.new(_var.value, GICrystal::Transfer::Full)
    end

    def glyph_item=(value : Pango::GlyphItem)
      # Property setter
      _var = (@pointer + 0).as(Pointer(Pointer(LibPango::GlyphItem))).value = value.to_unsafe
      value
    end

    def text : ::String
      # Property getter
      _var = (@pointer + 8).as(Pointer(Pointer(LibC::Char)))
      GICrystal.transfer_full(_var.value)
    end

    def text=(value : ::String)
      # Property setter
      _var = (@pointer + 8).as(Pointer(Pointer(LibC::Char))).value = value
      value
    end

    def start_glyph : Int32
      # Property getter
      _var = (@pointer + 16).as(Pointer(Int32))
      _var.value
    end

    def start_glyph=(value : Int32)
      # Property setter
      _var = (@pointer + 16).as(Pointer(Int32)).value = value
      value
    end

    def start_index : Int32
      # Property getter
      _var = (@pointer + 20).as(Pointer(Int32))
      _var.value
    end

    def start_index=(value : Int32)
      # Property setter
      _var = (@pointer + 20).as(Pointer(Int32)).value = value
      value
    end

    def start_char : Int32
      # Property getter
      _var = (@pointer + 24).as(Pointer(Int32))
      _var.value
    end

    def start_char=(value : Int32)
      # Property setter
      _var = (@pointer + 24).as(Pointer(Int32)).value = value
      value
    end

    def end_glyph : Int32
      # Property getter
      _var = (@pointer + 28).as(Pointer(Int32))
      _var.value
    end

    def end_glyph=(value : Int32)
      # Property setter
      _var = (@pointer + 28).as(Pointer(Int32)).value = value
      value
    end

    def end_index : Int32
      # Property getter
      _var = (@pointer + 32).as(Pointer(Int32))
      _var.value
    end

    def end_index=(value : Int32)
      # Property setter
      _var = (@pointer + 32).as(Pointer(Int32)).value = value
      value
    end

    def end_char : Int32
      # Property getter
      _var = (@pointer + 36).as(Pointer(Int32))
      _var.value
    end

    def end_char=(value : Int32)
      # Property setter
      _var = (@pointer + 36).as(Pointer(Int32)).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibPango.pango_glyph_item_iter_get_type
    end

    def copy : Pango::GlyphItemIter?
      # pango_glyph_item_iter_copy: (Method)
      # Returns: (transfer full)

      _retval = LibPango.pango_glyph_item_iter_copy(self)
      Pango::GlyphItemIter.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def free : Nil
      # pango_glyph_item_iter_free: (Method)
      # Returns: (transfer none)

      LibPango.pango_glyph_item_iter_free(self)
    end

    def init_end(glyph_item : Pango::GlyphItem, text : ::String) : Bool
      # pango_glyph_item_iter_init_end: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_glyph_item_iter_init_end(self, glyph_item, text)
      GICrystal.to_bool(_retval)
    end

    def init_start(glyph_item : Pango::GlyphItem, text : ::String) : Bool
      # pango_glyph_item_iter_init_start: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_glyph_item_iter_init_start(self, glyph_item, text)
      GICrystal.to_bool(_retval)
    end

    def next_cluster : Bool
      # pango_glyph_item_iter_next_cluster: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_glyph_item_iter_next_cluster(self)
      GICrystal.to_bool(_retval)
    end

    def prev_cluster : Bool
      # pango_glyph_item_iter_prev_cluster: (Method)
      # Returns: (transfer none)

      _retval = LibPango.pango_glyph_item_iter_prev_cluster(self)
      GICrystal.to_bool(_retval)
    end

    def to_unsafe
      @pointer
    end
  end
end
