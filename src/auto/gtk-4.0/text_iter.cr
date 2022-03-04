module Gtk
  # An iterator for the contents of a `GtkTextBuffer`.
  #
  # You may wish to begin by reading the
  # [text widget conceptual overview](section-text-widget.html),
  # which gives an overview of all the objects and data types
  # related to the text widget and how they work together.
  class TextIter
    @pointer : Pointer(Void)

    def initialize(pointer : Pointer(Void), transfer : GICrystal::Transfer)
      raise ArgumentError.new if pointer.null?

      # Raw structs are always moved to Crystal memory.
      @pointer = Pointer(Void).malloc(sizeof(LibGtk::TextIter))
      @pointer.copy_from(pointer, sizeof(LibGtk::TextIter))
      LibGLib.g_free(pointer) if transfer.full?
    end

    def self.new(dummy1 : Pointer(Void)? = nil, dummy2 : Pointer(Void)? = nil, dummy3 : Int32? = nil, dummy4 : Int32? = nil, dummy5 : Int32? = nil, dummy6 : Int32? = nil, dummy7 : Int32? = nil, dummy8 : Int32? = nil, dummy9 : Pointer(Void)? = nil, dummy10 : Pointer(Void)? = nil, dummy11 : Int32? = nil, dummy12 : Int32? = nil, dummy13 : Int32? = nil, dummy14 : Pointer(Void)? = nil)
      _ptr = Pointer(Void).malloc(80)
      _instance = new(_ptr, GICrystal::Transfer::None)
      _instance.dummy1 = dummy1 unless dummy1.nil?
      _instance.dummy2 = dummy2 unless dummy2.nil?
      _instance.dummy3 = dummy3 unless dummy3.nil?
      _instance.dummy4 = dummy4 unless dummy4.nil?
      _instance.dummy5 = dummy5 unless dummy5.nil?
      _instance.dummy6 = dummy6 unless dummy6.nil?
      _instance.dummy7 = dummy7 unless dummy7.nil?
      _instance.dummy8 = dummy8 unless dummy8.nil?
      _instance.dummy9 = dummy9 unless dummy9.nil?
      _instance.dummy10 = dummy10 unless dummy10.nil?
      _instance.dummy11 = dummy11 unless dummy11.nil?
      _instance.dummy12 = dummy12 unless dummy12.nil?
      _instance.dummy13 = dummy13 unless dummy13.nil?
      _instance.dummy14 = dummy14 unless dummy14.nil?
      _instance
    end

    def finalize
    end

    def dummy1 : Pointer(Void)
      # Property getter
      _var = (@pointer + 0).as(Pointer(Pointer(Void)))
      _var.value
    end

    def dummy1=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 0).as(Pointer(Pointer(Void))).value = value
      value
    end

    def dummy2 : Pointer(Void)
      # Property getter
      _var = (@pointer + 8).as(Pointer(Pointer(Void)))
      _var.value
    end

    def dummy2=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 8).as(Pointer(Pointer(Void))).value = value
      value
    end

    def dummy3 : Int32
      # Property getter
      _var = (@pointer + 16).as(Pointer(Int32))
      _var.value
    end

    def dummy3=(value : Int32)
      # Property setter
      _var = (@pointer + 16).as(Pointer(Int32)).value = value
      value
    end

    def dummy4 : Int32
      # Property getter
      _var = (@pointer + 20).as(Pointer(Int32))
      _var.value
    end

    def dummy4=(value : Int32)
      # Property setter
      _var = (@pointer + 20).as(Pointer(Int32)).value = value
      value
    end

    def dummy5 : Int32
      # Property getter
      _var = (@pointer + 24).as(Pointer(Int32))
      _var.value
    end

    def dummy5=(value : Int32)
      # Property setter
      _var = (@pointer + 24).as(Pointer(Int32)).value = value
      value
    end

    def dummy6 : Int32
      # Property getter
      _var = (@pointer + 28).as(Pointer(Int32))
      _var.value
    end

    def dummy6=(value : Int32)
      # Property setter
      _var = (@pointer + 28).as(Pointer(Int32)).value = value
      value
    end

    def dummy7 : Int32
      # Property getter
      _var = (@pointer + 32).as(Pointer(Int32))
      _var.value
    end

    def dummy7=(value : Int32)
      # Property setter
      _var = (@pointer + 32).as(Pointer(Int32)).value = value
      value
    end

    def dummy8 : Int32
      # Property getter
      _var = (@pointer + 36).as(Pointer(Int32))
      _var.value
    end

    def dummy8=(value : Int32)
      # Property setter
      _var = (@pointer + 36).as(Pointer(Int32)).value = value
      value
    end

    def dummy9 : Pointer(Void)
      # Property getter
      _var = (@pointer + 40).as(Pointer(Pointer(Void)))
      _var.value
    end

    def dummy9=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 40).as(Pointer(Pointer(Void))).value = value
      value
    end

    def dummy10 : Pointer(Void)
      # Property getter
      _var = (@pointer + 48).as(Pointer(Pointer(Void)))
      _var.value
    end

    def dummy10=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 48).as(Pointer(Pointer(Void))).value = value
      value
    end

    def dummy11 : Int32
      # Property getter
      _var = (@pointer + 56).as(Pointer(Int32))
      _var.value
    end

    def dummy11=(value : Int32)
      # Property setter
      _var = (@pointer + 56).as(Pointer(Int32)).value = value
      value
    end

    def dummy12 : Int32
      # Property getter
      _var = (@pointer + 60).as(Pointer(Int32))
      _var.value
    end

    def dummy12=(value : Int32)
      # Property setter
      _var = (@pointer + 60).as(Pointer(Int32)).value = value
      value
    end

    def dummy13 : Int32
      # Property getter
      _var = (@pointer + 64).as(Pointer(Int32))
      _var.value
    end

    def dummy13=(value : Int32)
      # Property setter
      _var = (@pointer + 64).as(Pointer(Int32)).value = value
      value
    end

    def dummy14 : Pointer(Void)
      # Property getter
      _var = (@pointer + 72).as(Pointer(Pointer(Void)))
      _var.value
    end

    def dummy14=(value : Pointer(Void))
      # Property setter
      _var = (@pointer + 72).as(Pointer(Pointer(Void))).value = value
      value
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_text_iter_get_type
    end

    def assign(other : Gtk::TextIter) : Nil
      # gtk_text_iter_assign: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_iter_assign(self, other)

      # Return value handling
    end

    def backward_char : Bool
      # gtk_text_iter_backward_char: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_backward_char(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def backward_chars(count : Int32) : Bool
      # gtk_text_iter_backward_chars: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_backward_chars(self, count)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def backward_cursor_position : Bool
      # gtk_text_iter_backward_cursor_position: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_backward_cursor_position(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def backward_cursor_positions(count : Int32) : Bool
      # gtk_text_iter_backward_cursor_positions: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_backward_cursor_positions(self, count)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def backward_find_char(pred : Pointer(Void), user_data : Pointer(Void)?, limit : Gtk::TextIter?) : Bool
      # gtk_text_iter_backward_find_char: (Method)
      # @user_data: (nullable)
      # @limit: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end
      limit = if limit.nil?
                Pointer(Void).null
              else
                limit.to_unsafe
              end

      # C call
      _retval = LibGtk.gtk_text_iter_backward_find_char(self, pred, user_data, limit)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def backward_line : Bool
      # gtk_text_iter_backward_line: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_backward_line(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def backward_lines(count : Int32) : Bool
      # gtk_text_iter_backward_lines: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_backward_lines(self, count)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def backward_search(str : ::String, flags : Gtk::TextSearchFlags, limit : Gtk::TextIter?) : Gtk::TextIter
      # gtk_text_iter_backward_search: (Method)
      # @match_start: (out) (caller-allocates) (optional)
      # @match_end: (out) (caller-allocates) (optional)
      # @limit: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      match_start = Pointer(Void).null
      match_end = Pointer(Void).null
      limit = if limit.nil?
                Pointer(Void).null
              else
                limit.to_unsafe
              end
      match_start = Gtk::TextIter.new

      # C call
      _retval = LibGtk.gtk_text_iter_backward_search(self, str, flags, match_start, match_end, limit)

      # Return value handling
      match_start
    end

    def backward_sentence_start : Bool
      # gtk_text_iter_backward_sentence_start: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_backward_sentence_start(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def backward_sentence_starts(count : Int32) : Bool
      # gtk_text_iter_backward_sentence_starts: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_backward_sentence_starts(self, count)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def backward_to_tag_toggle(tag : Gtk::TextTag?) : Bool
      # gtk_text_iter_backward_to_tag_toggle: (Method)
      # @tag: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      tag = if tag.nil?
              Pointer(Void).null
            else
              tag.to_unsafe
            end

      # C call
      _retval = LibGtk.gtk_text_iter_backward_to_tag_toggle(self, tag)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def backward_visible_cursor_position : Bool
      # gtk_text_iter_backward_visible_cursor_position: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_backward_visible_cursor_position(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def backward_visible_cursor_positions(count : Int32) : Bool
      # gtk_text_iter_backward_visible_cursor_positions: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_backward_visible_cursor_positions(self, count)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def backward_visible_line : Bool
      # gtk_text_iter_backward_visible_line: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_backward_visible_line(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def backward_visible_lines(count : Int32) : Bool
      # gtk_text_iter_backward_visible_lines: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_backward_visible_lines(self, count)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def backward_visible_word_start : Bool
      # gtk_text_iter_backward_visible_word_start: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_backward_visible_word_start(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def backward_visible_word_starts(count : Int32) : Bool
      # gtk_text_iter_backward_visible_word_starts: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_backward_visible_word_starts(self, count)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def backward_word_start : Bool
      # gtk_text_iter_backward_word_start: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_backward_word_start(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def backward_word_starts(count : Int32) : Bool
      # gtk_text_iter_backward_word_starts: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_backward_word_starts(self, count)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def can_insert(default_editability : Bool) : Bool
      # gtk_text_iter_can_insert: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_can_insert(self, default_editability)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def compare(rhs : Gtk::TextIter) : Int32
      # gtk_text_iter_compare: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_compare(self, rhs)

      # Return value handling
      _retval
    end

    def copy : Gtk::TextIter
      # gtk_text_iter_copy: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_copy(self)

      # Return value handling
      Gtk::TextIter.new(_retval, GICrystal::Transfer::Full)
    end

    def editable(default_setting : Bool) : Bool
      # gtk_text_iter_editable: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_editable(self, default_setting)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def ends_line : Bool
      # gtk_text_iter_ends_line: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_ends_line(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def ends_sentence : Bool
      # gtk_text_iter_ends_sentence: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_ends_sentence(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def ends_tag(tag : Gtk::TextTag?) : Bool
      # gtk_text_iter_ends_tag: (Method)
      # @tag: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      tag = if tag.nil?
              Pointer(Void).null
            else
              tag.to_unsafe
            end

      # C call
      _retval = LibGtk.gtk_text_iter_ends_tag(self, tag)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def ends_word : Bool
      # gtk_text_iter_ends_word: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_ends_word(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def equal(rhs : Gtk::TextIter) : Bool
      # gtk_text_iter_equal: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_equal(self, rhs)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def forward_char : Bool
      # gtk_text_iter_forward_char: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_forward_char(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def forward_chars(count : Int32) : Bool
      # gtk_text_iter_forward_chars: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_forward_chars(self, count)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def forward_cursor_position : Bool
      # gtk_text_iter_forward_cursor_position: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_forward_cursor_position(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def forward_cursor_positions(count : Int32) : Bool
      # gtk_text_iter_forward_cursor_positions: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_forward_cursor_positions(self, count)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def forward_find_char(pred : Pointer(Void), user_data : Pointer(Void)?, limit : Gtk::TextIter?) : Bool
      # gtk_text_iter_forward_find_char: (Method)
      # @user_data: (nullable)
      # @limit: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end
      limit = if limit.nil?
                Pointer(Void).null
              else
                limit.to_unsafe
              end

      # C call
      _retval = LibGtk.gtk_text_iter_forward_find_char(self, pred, user_data, limit)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def forward_line : Bool
      # gtk_text_iter_forward_line: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_forward_line(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def forward_lines(count : Int32) : Bool
      # gtk_text_iter_forward_lines: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_forward_lines(self, count)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def forward_search(str : ::String, flags : Gtk::TextSearchFlags, limit : Gtk::TextIter?) : Gtk::TextIter
      # gtk_text_iter_forward_search: (Method)
      # @match_start: (out) (caller-allocates) (optional)
      # @match_end: (out) (caller-allocates) (optional)
      # @limit: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      match_start = Pointer(Void).null
      match_end = Pointer(Void).null
      limit = if limit.nil?
                Pointer(Void).null
              else
                limit.to_unsafe
              end
      match_start = Gtk::TextIter.new

      # C call
      _retval = LibGtk.gtk_text_iter_forward_search(self, str, flags, match_start, match_end, limit)

      # Return value handling
      match_start
    end

    def forward_sentence_end : Bool
      # gtk_text_iter_forward_sentence_end: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_forward_sentence_end(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def forward_sentence_ends(count : Int32) : Bool
      # gtk_text_iter_forward_sentence_ends: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_forward_sentence_ends(self, count)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def forward_to_end : Nil
      # gtk_text_iter_forward_to_end: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_iter_forward_to_end(self)

      # Return value handling
    end

    def forward_to_line_end : Bool
      # gtk_text_iter_forward_to_line_end: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_forward_to_line_end(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def forward_to_tag_toggle(tag : Gtk::TextTag?) : Bool
      # gtk_text_iter_forward_to_tag_toggle: (Method)
      # @tag: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      tag = if tag.nil?
              Pointer(Void).null
            else
              tag.to_unsafe
            end

      # C call
      _retval = LibGtk.gtk_text_iter_forward_to_tag_toggle(self, tag)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def forward_visible_cursor_position : Bool
      # gtk_text_iter_forward_visible_cursor_position: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_forward_visible_cursor_position(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def forward_visible_cursor_positions(count : Int32) : Bool
      # gtk_text_iter_forward_visible_cursor_positions: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_forward_visible_cursor_positions(self, count)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def forward_visible_line : Bool
      # gtk_text_iter_forward_visible_line: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_forward_visible_line(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def forward_visible_lines(count : Int32) : Bool
      # gtk_text_iter_forward_visible_lines: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_forward_visible_lines(self, count)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def forward_visible_word_end : Bool
      # gtk_text_iter_forward_visible_word_end: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_forward_visible_word_end(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def forward_visible_word_ends(count : Int32) : Bool
      # gtk_text_iter_forward_visible_word_ends: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_forward_visible_word_ends(self, count)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def forward_word_end : Bool
      # gtk_text_iter_forward_word_end: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_forward_word_end(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def forward_word_ends(count : Int32) : Bool
      # gtk_text_iter_forward_word_ends: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_forward_word_ends(self, count)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def free : Nil
      # gtk_text_iter_free: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_iter_free(self)

      # Return value handling
    end

    def buffer : Gtk::TextBuffer
      # gtk_text_iter_get_buffer: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_get_buffer(self)

      # Return value handling
      Gtk::TextBuffer.new(_retval, GICrystal::Transfer::None)
    end

    def bytes_in_line : Int32
      # gtk_text_iter_get_bytes_in_line: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_get_bytes_in_line(self)

      # Return value handling
      _retval
    end

    def char : UInt32
      # gtk_text_iter_get_char: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_get_char(self)

      # Return value handling
      _retval
    end

    def chars_in_line : Int32
      # gtk_text_iter_get_chars_in_line: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_get_chars_in_line(self)

      # Return value handling
      _retval
    end

    def child_anchor : Gtk::TextChildAnchor
      # gtk_text_iter_get_child_anchor: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_get_child_anchor(self)

      # Return value handling
      Gtk::TextChildAnchor.new(_retval, GICrystal::Transfer::None)
    end

    def language : Pango::Language
      # gtk_text_iter_get_language: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_get_language(self)

      # Return value handling
      Pango::Language.new(_retval, GICrystal::Transfer::Full)
    end

    def line : Int32
      # gtk_text_iter_get_line: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_get_line(self)

      # Return value handling
      _retval
    end

    def line_index : Int32
      # gtk_text_iter_get_line_index: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_get_line_index(self)

      # Return value handling
      _retval
    end

    def line_offset : Int32
      # gtk_text_iter_get_line_offset: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_get_line_offset(self)

      # Return value handling
      _retval
    end

    def marks : GLib::SList
      # gtk_text_iter_get_marks: (Method)
      # Returns: (transfer container)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_get_marks(self)

      # Return value handling
      GLib::SList(Gtk::TextMark).new(_retval, GICrystal::Transfer::Container)
    end

    def offset : Int32
      # gtk_text_iter_get_offset: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_get_offset(self)

      # Return value handling
      _retval
    end

    def paintable : Gdk::Paintable
      # gtk_text_iter_get_paintable: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_get_paintable(self)

      # Return value handling
      Gdk::Paintable__Impl.new(_retval, GICrystal::Transfer::None)
    end

    def slice(end _end : Gtk::TextIter) : ::String
      # gtk_text_iter_get_slice: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_get_slice(self, _end)

      # Return value handling
      GICrystal.transfer_full(_retval)
    end

    def tags : GLib::SList
      # gtk_text_iter_get_tags: (Method)
      # Returns: (transfer container)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_get_tags(self)

      # Return value handling
      GLib::SList(Gtk::TextTag).new(_retval, GICrystal::Transfer::Container)
    end

    def text(end _end : Gtk::TextIter) : ::String
      # gtk_text_iter_get_text: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_get_text(self, _end)

      # Return value handling
      GICrystal.transfer_full(_retval)
    end

    def toggled_tags(toggled_on : Bool) : GLib::SList
      # gtk_text_iter_get_toggled_tags: (Method)
      # Returns: (transfer container)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_get_toggled_tags(self, toggled_on)

      # Return value handling
      GLib::SList(Gtk::TextTag).new(_retval, GICrystal::Transfer::Container)
    end

    def visible_line_index : Int32
      # gtk_text_iter_get_visible_line_index: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_get_visible_line_index(self)

      # Return value handling
      _retval
    end

    def visible_line_offset : Int32
      # gtk_text_iter_get_visible_line_offset: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_get_visible_line_offset(self)

      # Return value handling
      _retval
    end

    def visible_slice(end _end : Gtk::TextIter) : ::String
      # gtk_text_iter_get_visible_slice: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_get_visible_slice(self, _end)

      # Return value handling
      GICrystal.transfer_full(_retval)
    end

    def visible_text(end _end : Gtk::TextIter) : ::String
      # gtk_text_iter_get_visible_text: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_get_visible_text(self, _end)

      # Return value handling
      GICrystal.transfer_full(_retval)
    end

    def has_tag(tag : Gtk::TextTag) : Bool
      # gtk_text_iter_has_tag: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_has_tag(self, tag)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def in_range(start : Gtk::TextIter, end _end : Gtk::TextIter) : Bool
      # gtk_text_iter_in_range: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_in_range(self, start, _end)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def inside_sentence : Bool
      # gtk_text_iter_inside_sentence: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_inside_sentence(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def inside_word : Bool
      # gtk_text_iter_inside_word: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_inside_word(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def is_cursor_position : Bool
      # gtk_text_iter_is_cursor_position: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_is_cursor_position(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def is_end : Bool
      # gtk_text_iter_is_end: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_is_end(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def is_start : Bool
      # gtk_text_iter_is_start: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_is_start(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def order(second : Gtk::TextIter) : Nil
      # gtk_text_iter_order: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_iter_order(self, second)

      # Return value handling
    end

    def line=(line_number : Int32) : Nil
      # gtk_text_iter_set_line: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_iter_set_line(self, line_number)

      # Return value handling
    end

    def line_index=(byte_on_line : Int32) : Nil
      # gtk_text_iter_set_line_index: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_iter_set_line_index(self, byte_on_line)

      # Return value handling
    end

    def line_offset=(char_on_line : Int32) : Nil
      # gtk_text_iter_set_line_offset: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_iter_set_line_offset(self, char_on_line)

      # Return value handling
    end

    def offset=(char_offset : Int32) : Nil
      # gtk_text_iter_set_offset: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_iter_set_offset(self, char_offset)

      # Return value handling
    end

    def visible_line_index=(byte_on_line : Int32) : Nil
      # gtk_text_iter_set_visible_line_index: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_iter_set_visible_line_index(self, byte_on_line)

      # Return value handling
    end

    def visible_line_offset=(char_on_line : Int32) : Nil
      # gtk_text_iter_set_visible_line_offset: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_iter_set_visible_line_offset(self, char_on_line)

      # Return value handling
    end

    def starts_line : Bool
      # gtk_text_iter_starts_line: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_starts_line(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def starts_sentence : Bool
      # gtk_text_iter_starts_sentence: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_starts_sentence(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def starts_tag(tag : Gtk::TextTag?) : Bool
      # gtk_text_iter_starts_tag: (Method)
      # @tag: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      tag = if tag.nil?
              Pointer(Void).null
            else
              tag.to_unsafe
            end

      # C call
      _retval = LibGtk.gtk_text_iter_starts_tag(self, tag)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def starts_word : Bool
      # gtk_text_iter_starts_word: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_iter_starts_word(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def toggles_tag(tag : Gtk::TextTag?) : Bool
      # gtk_text_iter_toggles_tag: (Method)
      # @tag: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      tag = if tag.nil?
              Pointer(Void).null
            else
              tag.to_unsafe
            end

      # C call
      _retval = LibGtk.gtk_text_iter_toggles_tag(self, tag)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def to_unsafe
      @pointer
    end
  end
end
