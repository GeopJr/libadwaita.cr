require "../g_object-2.0/object"

module Gtk
  # Stores text and attributes for display in a `GtkTextView`.
  #
  # You may wish to begin by reading the
  # [text widget conceptual overview](section-text-widget.html),
  # which gives an overview of all the objects and data types
  # related to the text widget and how they work together.
  #
  # GtkTextBuffer can support undoing changes to the buffer
  # content, see [method@Gtk.TextBuffer.set_enable_undo].
  class TextBuffer < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, can_redo : Bool? = nil, can_undo : Bool? = nil, cursor_position : Int32? = nil, enable_undo : Bool? = nil, has_selection : Bool? = nil, tag_table : Gtk::TextTagTable? = nil, text : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[7]
      _values = StaticArray(LibGObject::Value, 7).new(LibGObject::Value.new)
      _n = 0

      if can_redo
        (_names.to_unsafe + _n).value = "can-redo".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_redo)
        _n += 1
      end
      if can_undo
        (_names.to_unsafe + _n).value = "can-undo".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_undo)
        _n += 1
      end
      if cursor_position
        (_names.to_unsafe + _n).value = "cursor-position".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cursor_position)
        _n += 1
      end
      if enable_undo
        (_names.to_unsafe + _n).value = "enable-undo".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enable_undo)
        _n += 1
      end
      if has_selection
        (_names.to_unsafe + _n).value = "has-selection".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_selection)
        _n += 1
      end
      if tag_table
        (_names.to_unsafe + _n).value = "tag-table".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tag_table)
        _n += 1
      end
      if text
        (_names.to_unsafe + _n).value = "text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, text)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TextBuffer.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_text_buffer_get_type
    end

    def can_redo? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "can-redo", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def can_undo? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "can-undo", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def cursor_position : Int32
      # Returns: None

      value = uninitialized Int32
      LibGObject.g_object_get(self, "cursor-position", pointerof(value), Pointer(Void).null)
      value
    end

    def enable_undo=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "enable-undo", unsafe_value, Pointer(Void).null)
      value
    end

    def enable_undo? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "enable-undo", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def has_selection? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "has-selection", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def tag_table=(value : Gtk::TextTagTable?) : Gtk::TextTagTable?
      unsafe_value = value

      LibGObject.g_object_set(self, "tag-table", unsafe_value, Pointer(Void).null)
      value
    end

    def tag_table : Gtk::TextTagTable?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "tag-table", pointerof(value), Pointer(Void).null)
      Gtk::TextTagTable.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def text=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "text", unsafe_value, Pointer(Void).null)
      value
    end

    def text : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "text", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def initialize(table : Gtk::TextTagTable?)
      # gtk_text_buffer_new: (Constructor)
      # @table: (nullable)
      # Returns: (transfer full)

      # Handle parameters
      table = if table.nil?
                Pointer(Void).null
              else
                table.to_unsafe
              end

      # C call
      _retval = LibGtk.gtk_text_buffer_new(table)

      # Return value handling
      @pointer = _retval
    end

    def add_mark(mark : Gtk::TextMark, where : Gtk::TextIter) : Nil
      # gtk_text_buffer_add_mark: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_add_mark(self, mark, where)

      # Return value handling
    end

    def add_selection_clipboard(clipboard : Gdk::Clipboard) : Nil
      # gtk_text_buffer_add_selection_clipboard: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_add_selection_clipboard(self, clipboard)

      # Return value handling
    end

    def apply_tag(tag : Gtk::TextTag, start : Gtk::TextIter, end _end : Gtk::TextIter) : Nil
      # gtk_text_buffer_apply_tag: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_apply_tag(self, tag, start, _end)

      # Return value handling
    end

    def apply_tag_by_name(name : ::String, start : Gtk::TextIter, end _end : Gtk::TextIter) : Nil
      # gtk_text_buffer_apply_tag_by_name: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_apply_tag_by_name(self, name, start, _end)

      # Return value handling
    end

    def backspace(iter : Gtk::TextIter, interactive : Bool, default_editable : Bool) : Bool
      # gtk_text_buffer_backspace: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_buffer_backspace(self, iter, interactive, default_editable)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def begin_irreversible_action : Nil
      # gtk_text_buffer_begin_irreversible_action: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_begin_irreversible_action(self)

      # Return value handling
    end

    def begin_user_action : Nil
      # gtk_text_buffer_begin_user_action: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_begin_user_action(self)

      # Return value handling
    end

    def copy_clipboard(clipboard : Gdk::Clipboard) : Nil
      # gtk_text_buffer_copy_clipboard: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_copy_clipboard(self, clipboard)

      # Return value handling
    end

    def create_child_anchor(iter : Gtk::TextIter) : Gtk::TextChildAnchor
      # gtk_text_buffer_create_child_anchor: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_buffer_create_child_anchor(self, iter)

      # Return value handling
      Gtk::TextChildAnchor.new(_retval, GICrystal::Transfer::None)
    end

    def create_mark(mark_name : ::String?, where : Gtk::TextIter, left_gravity : Bool) : Gtk::TextMark
      # gtk_text_buffer_create_mark: (Method)
      # @mark_name: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      mark_name = if mark_name.nil?
                    Pointer(LibC::Char).null
                  else
                    mark_name.to_unsafe
                  end

      # C call
      _retval = LibGtk.gtk_text_buffer_create_mark(self, mark_name, where, left_gravity)

      # Return value handling
      Gtk::TextMark.new(_retval, GICrystal::Transfer::None)
    end

    def cut_clipboard(clipboard : Gdk::Clipboard, default_editable : Bool) : Nil
      # gtk_text_buffer_cut_clipboard: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_cut_clipboard(self, clipboard, default_editable)

      # Return value handling
    end

    def delete(start : Gtk::TextIter, end _end : Gtk::TextIter) : Nil
      # gtk_text_buffer_delete: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_delete(self, start, _end)

      # Return value handling
    end

    def delete_interactive(start_iter : Gtk::TextIter, end_iter : Gtk::TextIter, default_editable : Bool) : Bool
      # gtk_text_buffer_delete_interactive: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_buffer_delete_interactive(self, start_iter, end_iter, default_editable)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def delete_mark(mark : Gtk::TextMark) : Nil
      # gtk_text_buffer_delete_mark: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_delete_mark(self, mark)

      # Return value handling
    end

    def delete_mark_by_name(name : ::String) : Nil
      # gtk_text_buffer_delete_mark_by_name: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_delete_mark_by_name(self, name)

      # Return value handling
    end

    def delete_selection(interactive : Bool, default_editable : Bool) : Bool
      # gtk_text_buffer_delete_selection: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_buffer_delete_selection(self, interactive, default_editable)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def end_irreversible_action : Nil
      # gtk_text_buffer_end_irreversible_action: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_end_irreversible_action(self)

      # Return value handling
    end

    def end_user_action : Nil
      # gtk_text_buffer_end_user_action: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_end_user_action(self)

      # Return value handling
    end

    def bounds : Gtk::TextIter
      # gtk_text_buffer_get_bounds: (Method)
      # @start: (out) (caller-allocates)
      # @end: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      start = Gtk::TextIter.new

      # C call
      LibGtk.gtk_text_buffer_get_bounds(self, start, _end)

      # Return value handling
      start
    end

    def can_redo : Bool
      # gtk_text_buffer_get_can_redo: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_buffer_get_can_redo(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def can_undo : Bool
      # gtk_text_buffer_get_can_undo: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_buffer_get_can_undo(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def char_count : Int32
      # gtk_text_buffer_get_char_count: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_buffer_get_char_count(self)

      # Return value handling
      _retval
    end

    def enable_undo : Bool
      # gtk_text_buffer_get_enable_undo: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_buffer_get_enable_undo(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def end_iter : Gtk::TextIter
      # gtk_text_buffer_get_end_iter: (Method)
      # @iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      iter = Gtk::TextIter.new

      # C call
      LibGtk.gtk_text_buffer_get_end_iter(self, iter)

      # Return value handling
      iter
    end

    def has_selection : Bool
      # gtk_text_buffer_get_has_selection: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_buffer_get_has_selection(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def insert : Gtk::TextMark
      # gtk_text_buffer_get_insert: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_buffer_get_insert(self)

      # Return value handling
      Gtk::TextMark.new(_retval, GICrystal::Transfer::None)
    end

    def iter_at_child_anchor(anchor : Gtk::TextChildAnchor) : Gtk::TextIter
      # gtk_text_buffer_get_iter_at_child_anchor: (Method)
      # @iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      iter = Gtk::TextIter.new

      # C call
      LibGtk.gtk_text_buffer_get_iter_at_child_anchor(self, iter, anchor)

      # Return value handling
      iter
    end

    def iter_at_line(line_number : Int32) : Gtk::TextIter
      # gtk_text_buffer_get_iter_at_line: (Method)
      # @iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      iter = Gtk::TextIter.new

      # C call
      _retval = LibGtk.gtk_text_buffer_get_iter_at_line(self, iter, line_number)

      # Return value handling
      iter
    end

    def iter_at_line_index(line_number : Int32, byte_index : Int32) : Gtk::TextIter
      # gtk_text_buffer_get_iter_at_line_index: (Method)
      # @iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      iter = Gtk::TextIter.new

      # C call
      _retval = LibGtk.gtk_text_buffer_get_iter_at_line_index(self, iter, line_number, byte_index)

      # Return value handling
      iter
    end

    def iter_at_line_offset(line_number : Int32, char_offset : Int32) : Gtk::TextIter
      # gtk_text_buffer_get_iter_at_line_offset: (Method)
      # @iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      iter = Gtk::TextIter.new

      # C call
      _retval = LibGtk.gtk_text_buffer_get_iter_at_line_offset(self, iter, line_number, char_offset)

      # Return value handling
      iter
    end

    def iter_at_mark(mark : Gtk::TextMark) : Gtk::TextIter
      # gtk_text_buffer_get_iter_at_mark: (Method)
      # @iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      iter = Gtk::TextIter.new

      # C call
      LibGtk.gtk_text_buffer_get_iter_at_mark(self, iter, mark)

      # Return value handling
      iter
    end

    def iter_at_offset(char_offset : Int32) : Gtk::TextIter
      # gtk_text_buffer_get_iter_at_offset: (Method)
      # @iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      iter = Gtk::TextIter.new

      # C call
      LibGtk.gtk_text_buffer_get_iter_at_offset(self, iter, char_offset)

      # Return value handling
      iter
    end

    def line_count : Int32
      # gtk_text_buffer_get_line_count: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_buffer_get_line_count(self)

      # Return value handling
      _retval
    end

    def mark(name : ::String) : Gtk::TextMark?
      # gtk_text_buffer_get_mark: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_buffer_get_mark(self, name)

      # Return value handling
      Gtk::TextMark.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def max_undo_levels : UInt32
      # gtk_text_buffer_get_max_undo_levels: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_buffer_get_max_undo_levels(self)

      # Return value handling
      _retval
    end

    def modified : Bool
      # gtk_text_buffer_get_modified: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_buffer_get_modified(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def selection_bound : Gtk::TextMark
      # gtk_text_buffer_get_selection_bound: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_buffer_get_selection_bound(self)

      # Return value handling
      Gtk::TextMark.new(_retval, GICrystal::Transfer::None)
    end

    def selection_bounds : Gtk::TextIter
      # gtk_text_buffer_get_selection_bounds: (Method)
      # @start: (out) (caller-allocates)
      # @end: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      start = Gtk::TextIter.new

      # C call
      _retval = LibGtk.gtk_text_buffer_get_selection_bounds(self, start, _end)

      # Return value handling
      start
    end

    def selection_content : Gdk::ContentProvider
      # gtk_text_buffer_get_selection_content: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_buffer_get_selection_content(self)

      # Return value handling
      Gdk::ContentProvider.new(_retval, GICrystal::Transfer::Full)
    end

    def slice(start : Gtk::TextIter, end _end : Gtk::TextIter, include_hidden_chars : Bool) : ::String
      # gtk_text_buffer_get_slice: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_buffer_get_slice(self, start, _end, include_hidden_chars)

      # Return value handling
      GICrystal.transfer_full(_retval)
    end

    def start_iter : Gtk::TextIter
      # gtk_text_buffer_get_start_iter: (Method)
      # @iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Handle parameters
      iter = Gtk::TextIter.new

      # C call
      LibGtk.gtk_text_buffer_get_start_iter(self, iter)

      # Return value handling
      iter
    end

    def tag_table : Gtk::TextTagTable
      # gtk_text_buffer_get_tag_table: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_buffer_get_tag_table(self)

      # Return value handling
      Gtk::TextTagTable.new(_retval, GICrystal::Transfer::None)
    end

    def text(start : Gtk::TextIter, end _end : Gtk::TextIter, include_hidden_chars : Bool) : ::String
      # gtk_text_buffer_get_text: (Method | Getter)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_buffer_get_text(self, start, _end, include_hidden_chars)

      # Return value handling
      GICrystal.transfer_full(_retval)
    end

    def insert(iter : Gtk::TextIter, text : ::String, len : Int32) : Nil
      # gtk_text_buffer_insert: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_insert(self, iter, text, len)

      # Return value handling
    end

    def insert_at_cursor(text : ::String, len : Int32) : Nil
      # gtk_text_buffer_insert_at_cursor: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_insert_at_cursor(self, text, len)

      # Return value handling
    end

    def insert_child_anchor(iter : Gtk::TextIter, anchor : Gtk::TextChildAnchor) : Nil
      # gtk_text_buffer_insert_child_anchor: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_insert_child_anchor(self, iter, anchor)

      # Return value handling
    end

    def insert_interactive(iter : Gtk::TextIter, text : ::String, len : Int32, default_editable : Bool) : Bool
      # gtk_text_buffer_insert_interactive: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_buffer_insert_interactive(self, iter, text, len, default_editable)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def insert_interactive_at_cursor(text : ::String, len : Int32, default_editable : Bool) : Bool
      # gtk_text_buffer_insert_interactive_at_cursor: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_buffer_insert_interactive_at_cursor(self, text, len, default_editable)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def insert_markup(iter : Gtk::TextIter, markup : ::String, len : Int32) : Nil
      # gtk_text_buffer_insert_markup: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_insert_markup(self, iter, markup, len)

      # Return value handling
    end

    def insert_paintable(iter : Gtk::TextIter, paintable : Gdk::Paintable) : Nil
      # gtk_text_buffer_insert_paintable: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_insert_paintable(self, iter, paintable)

      # Return value handling
    end

    def insert_range(iter : Gtk::TextIter, start : Gtk::TextIter, end _end : Gtk::TextIter) : Nil
      # gtk_text_buffer_insert_range: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_insert_range(self, iter, start, _end)

      # Return value handling
    end

    def insert_range_interactive(iter : Gtk::TextIter, start : Gtk::TextIter, end _end : Gtk::TextIter, default_editable : Bool) : Bool
      # gtk_text_buffer_insert_range_interactive: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_text_buffer_insert_range_interactive(self, iter, start, _end, default_editable)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def move_mark(mark : Gtk::TextMark, where : Gtk::TextIter) : Nil
      # gtk_text_buffer_move_mark: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_move_mark(self, mark, where)

      # Return value handling
    end

    def move_mark_by_name(name : ::String, where : Gtk::TextIter) : Nil
      # gtk_text_buffer_move_mark_by_name: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_move_mark_by_name(self, name, where)

      # Return value handling
    end

    def paste_clipboard(clipboard : Gdk::Clipboard, override_location : Gtk::TextIter?, default_editable : Bool) : Nil
      # gtk_text_buffer_paste_clipboard: (Method)
      # @override_location: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      override_location = if override_location.nil?
                            Pointer(Void).null
                          else
                            override_location.to_unsafe
                          end

      # C call
      LibGtk.gtk_text_buffer_paste_clipboard(self, clipboard, override_location, default_editable)

      # Return value handling
    end

    def place_cursor(where : Gtk::TextIter) : Nil
      # gtk_text_buffer_place_cursor: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_place_cursor(self, where)

      # Return value handling
    end

    def redo : Nil
      # gtk_text_buffer_redo: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_redo(self)

      # Return value handling
    end

    def remove_all_tags(start : Gtk::TextIter, end _end : Gtk::TextIter) : Nil
      # gtk_text_buffer_remove_all_tags: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_remove_all_tags(self, start, _end)

      # Return value handling
    end

    def remove_selection_clipboard(clipboard : Gdk::Clipboard) : Nil
      # gtk_text_buffer_remove_selection_clipboard: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_remove_selection_clipboard(self, clipboard)

      # Return value handling
    end

    def remove_tag(tag : Gtk::TextTag, start : Gtk::TextIter, end _end : Gtk::TextIter) : Nil
      # gtk_text_buffer_remove_tag: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_remove_tag(self, tag, start, _end)

      # Return value handling
    end

    def remove_tag_by_name(name : ::String, start : Gtk::TextIter, end _end : Gtk::TextIter) : Nil
      # gtk_text_buffer_remove_tag_by_name: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_remove_tag_by_name(self, name, start, _end)

      # Return value handling
    end

    def select_range(ins : Gtk::TextIter, bound : Gtk::TextIter) : Nil
      # gtk_text_buffer_select_range: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_select_range(self, ins, bound)

      # Return value handling
    end

    def enable_undo=(enable_undo : Bool) : Nil
      # gtk_text_buffer_set_enable_undo: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_set_enable_undo(self, enable_undo)

      # Return value handling
    end

    def max_undo_levels=(max_undo_levels : UInt32) : Nil
      # gtk_text_buffer_set_max_undo_levels: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_set_max_undo_levels(self, max_undo_levels)

      # Return value handling
    end

    def modified=(setting : Bool) : Nil
      # gtk_text_buffer_set_modified: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_set_modified(self, setting)

      # Return value handling
    end

    def set_text(text : ::String, len : Int32) : Nil
      # gtk_text_buffer_set_text: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_set_text(self, text, len)

      # Return value handling
    end

    def undo : Nil
      # gtk_text_buffer_undo: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_text_buffer_undo(self)

      # Return value handling
    end

    struct ApplyTagSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "apply-tag::#{@detail}" : "apply-tag"
      end

      def connect(&block : Proc(Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TextTag.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TextIter.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = Gtk::TextIter.new(lib_arg2, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TextTag.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TextIter.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = Gtk::TextIter.new(lib_arg2, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextBuffer, Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextBuffer.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TextTag.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TextIter.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = Gtk::TextIter.new(lib_arg2, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextBuffer, Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextBuffer.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TextTag.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TextIter.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = Gtk::TextIter.new(lib_arg2, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(tag : Gtk::TextTag, start : Gtk::TextIter, _end : Gtk::TextIter) : Nil
        LibGObject.g_signal_emit_by_name(@source, "apply-tag", tag, start, _end)
      end
    end

    def apply_tag_signal
      ApplyTagSignal.new(self)
    end

    struct BeginUserActionSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "begin-user-action::#{@detail}" : "begin-user-action"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextBuffer, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextBuffer.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextBuffer, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextBuffer.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "begin-user-action")
      end
    end

    def begin_user_action_signal
      BeginUserActionSignal.new(self)
    end

    struct ChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "changed::#{@detail}" : "changed"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextBuffer, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextBuffer.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextBuffer, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextBuffer.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "changed")
      end
    end

    def changed_signal
      ChangedSignal.new(self)
    end

    struct DeleteRangeSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "delete-range::#{@detail}" : "delete-range"
      end

      def connect(&block : Proc(Gtk::TextIter, Gtk::TextIter, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::TextIter, Gtk::TextIter, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::TextIter, Gtk::TextIter, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TextIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TextIter.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextIter, Gtk::TextIter, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextIter, Gtk::TextIter, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TextIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TextIter.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextIter, Gtk::TextIter, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextBuffer, Gtk::TextIter, Gtk::TextIter, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextBuffer.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TextIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TextIter.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextIter, Gtk::TextIter, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextBuffer, Gtk::TextIter, Gtk::TextIter, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextBuffer.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TextIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TextIter.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextIter, Gtk::TextIter, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(start : Gtk::TextIter, _end : Gtk::TextIter) : Nil
        LibGObject.g_signal_emit_by_name(@source, "delete-range", start, _end)
      end
    end

    def delete_range_signal
      DeleteRangeSignal.new(self)
    end

    struct EndUserActionSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "end-user-action::#{@detail}" : "end-user-action"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextBuffer, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextBuffer.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextBuffer, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextBuffer.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "end-user-action")
      end
    end

    def end_user_action_signal
      EndUserActionSignal.new(self)
    end

    struct InsertChildAnchorSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "insert-child-anchor::#{@detail}" : "insert-child-anchor"
      end

      def connect(&block : Proc(Gtk::TextIter, Gtk::TextChildAnchor, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::TextIter, Gtk::TextChildAnchor, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::TextIter, Gtk::TextChildAnchor, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TextIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TextChildAnchor.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextIter, Gtk::TextChildAnchor, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextIter, Gtk::TextChildAnchor, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TextIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TextChildAnchor.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextIter, Gtk::TextChildAnchor, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextBuffer, Gtk::TextIter, Gtk::TextChildAnchor, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextBuffer.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TextIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TextChildAnchor.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextIter, Gtk::TextChildAnchor, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextBuffer, Gtk::TextIter, Gtk::TextChildAnchor, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextBuffer.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TextIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TextChildAnchor.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextIter, Gtk::TextChildAnchor, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(location : Gtk::TextIter, anchor : Gtk::TextChildAnchor) : Nil
        LibGObject.g_signal_emit_by_name(@source, "insert-child-anchor", location, anchor)
      end
    end

    def insert_child_anchor_signal
      InsertChildAnchorSignal.new(self)
    end

    struct InsertPaintableSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "insert-paintable::#{@detail}" : "insert-paintable"
      end

      def connect(&block : Proc(Gtk::TextIter, Gdk::Paintable, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::TextIter, Gdk::Paintable, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::TextIter, Gdk::Paintable, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TextIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gdk::Paintable__Impl.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextIter, Gdk::Paintable, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextIter, Gdk::Paintable, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TextIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gdk::Paintable__Impl.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextIter, Gdk::Paintable, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextBuffer, Gtk::TextIter, Gdk::Paintable, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextBuffer.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TextIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gdk::Paintable__Impl.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextIter, Gdk::Paintable, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextBuffer, Gtk::TextIter, Gdk::Paintable, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextBuffer.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TextIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gdk::Paintable__Impl.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextIter, Gdk::Paintable, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(location : Gtk::TextIter, paintable : Gdk::Paintable) : Nil
        LibGObject.g_signal_emit_by_name(@source, "insert-paintable", location, paintable)
      end
    end

    def insert_paintable_signal
      InsertPaintableSignal.new(self)
    end

    struct InsertTextSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "insert-text::#{@detail}" : "insert-text"
      end

      def connect(&block : Proc(Gtk::TextIter, ::String, Int32, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::TextIter, ::String, Int32, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::TextIter, ::String, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(LibC::Char), lib_arg2 : Int32, box : Pointer(Void)) {
          arg0 = Gtk::TextIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = ::String.new(lib_arg1)
          arg2 = lib_arg2
          ::Box(Proc(Gtk::TextIter, ::String, Int32, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextIter, ::String, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(LibC::Char), lib_arg2 : Int32, box : Pointer(Void)) {
          arg0 = Gtk::TextIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = ::String.new(lib_arg1)
          arg2 = lib_arg2
          ::Box(Proc(Gtk::TextIter, ::String, Int32, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextBuffer, Gtk::TextIter, ::String, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(LibC::Char), lib_arg2 : Int32, box : Pointer(Void)) {
          sender = Gtk::TextBuffer.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TextIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = ::String.new(lib_arg1)
          arg2 = lib_arg2
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextIter, ::String, Int32, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextBuffer, Gtk::TextIter, ::String, Int32, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(LibC::Char), lib_arg2 : Int32, box : Pointer(Void)) {
          sender = Gtk::TextBuffer.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TextIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = ::String.new(lib_arg1)
          arg2 = lib_arg2
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextIter, ::String, Int32, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(location : Gtk::TextIter, text : ::String, len : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "insert-text", location, text, len)
      end
    end

    def insert_text_signal
      InsertTextSignal.new(self)
    end

    struct MarkDeletedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "mark-deleted::#{@detail}" : "mark-deleted"
      end

      def connect(&block : Proc(Gtk::TextMark, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::TextMark, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::TextMark, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TextMark.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextMark, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextMark, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TextMark.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextMark, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextBuffer, Gtk::TextMark, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextBuffer.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TextMark.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextMark, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextBuffer, Gtk::TextMark, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextBuffer.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TextMark.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextMark, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(mark : Gtk::TextMark) : Nil
        LibGObject.g_signal_emit_by_name(@source, "mark-deleted", mark)
      end
    end

    def mark_deleted_signal
      MarkDeletedSignal.new(self)
    end

    struct MarkSetSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "mark-set::#{@detail}" : "mark-set"
      end

      def connect(&block : Proc(Gtk::TextIter, Gtk::TextMark, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::TextIter, Gtk::TextMark, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::TextIter, Gtk::TextMark, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TextIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TextMark.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextIter, Gtk::TextMark, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextIter, Gtk::TextMark, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TextIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TextMark.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextIter, Gtk::TextMark, Nil)).unbox(box).call(arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextBuffer, Gtk::TextIter, Gtk::TextMark, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextBuffer.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TextIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TextMark.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextIter, Gtk::TextMark, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextBuffer, Gtk::TextIter, Gtk::TextMark, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextBuffer.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TextIter.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TextMark.new(lib_arg1, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextIter, Gtk::TextMark, Nil)).unbox(box).call(sender, arg0, arg1)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(location : Gtk::TextIter, mark : Gtk::TextMark) : Nil
        LibGObject.g_signal_emit_by_name(@source, "mark-set", location, mark)
      end
    end

    def mark_set_signal
      MarkSetSignal.new(self)
    end

    struct ModifiedChangedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "modified-changed::#{@detail}" : "modified-changed"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextBuffer, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextBuffer.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextBuffer, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextBuffer.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "modified-changed")
      end
    end

    def modified_changed_signal
      ModifiedChangedSignal.new(self)
    end

    struct PasteDoneSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "paste-done::#{@detail}" : "paste-done"
      end

      def connect(&block : Proc(Gdk::Clipboard, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gdk::Clipboard, Nil))
        connect(block)
      end

      def connect(block : Proc(Gdk::Clipboard, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Clipboard.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Clipboard, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gdk::Clipboard, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gdk::Clipboard.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gdk::Clipboard, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextBuffer, Gdk::Clipboard, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextBuffer.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Clipboard.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Gdk::Clipboard, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextBuffer, Gdk::Clipboard, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextBuffer.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gdk::Clipboard.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Gdk::Clipboard, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(clipboard : Gdk::Clipboard) : Nil
        LibGObject.g_signal_emit_by_name(@source, "paste-done", clipboard)
      end
    end

    def paste_done_signal
      PasteDoneSignal.new(self)
    end

    struct RedoSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "redo::#{@detail}" : "redo"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextBuffer, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextBuffer.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextBuffer, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextBuffer.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "redo")
      end
    end

    def redo_signal
      RedoSignal.new(self)
    end

    struct RemoveTagSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "remove-tag::#{@detail}" : "remove-tag"
      end

      def connect(&block : Proc(Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TextTag.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TextIter.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = Gtk::TextIter.new(lib_arg2, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::TextTag.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TextIter.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = Gtk::TextIter.new(lib_arg2, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil)).unbox(box).call(arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextBuffer, Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextBuffer.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TextTag.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TextIter.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = Gtk::TextIter.new(lib_arg2, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextBuffer, Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), lib_arg1 : Pointer(Void), lib_arg2 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextBuffer.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::TextTag.new(lib_arg0, GICrystal::Transfer::None)
          arg1 = Gtk::TextIter.new(lib_arg1, GICrystal::Transfer::None)
          arg2 = Gtk::TextIter.new(lib_arg2, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil)).unbox(box).call(sender, arg0, arg1, arg2)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(tag : Gtk::TextTag, start : Gtk::TextIter, _end : Gtk::TextIter) : Nil
        LibGObject.g_signal_emit_by_name(@source, "remove-tag", tag, start, _end)
      end
    end

    def remove_tag_signal
      RemoveTagSignal.new(self)
    end

    struct UndoSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "undo::#{@detail}" : "undo"
      end

      def connect(&block : Proc(Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Nil))
        connect(block)
      end

      def connect(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(box).call
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::TextBuffer, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextBuffer.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::TextBuffer, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::TextBuffer.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "undo")
      end
    end

    def undo_signal
      UndoSignal.new(self)
    end
  end
end
