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
  # content, see `Gtk::TextBuffer#enable_undo=`.
  @[GObject::GeneratedWrapper]
  class TextBuffer < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::TextBufferClass), class_init,
        sizeof(LibGtk::TextBuffer), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, can_redo : Bool? = nil, can_undo : Bool? = nil, cursor_position : Int32? = nil, enable_undo : Bool? = nil, has_selection : Bool? = nil, tag_table : Gtk::TextTagTable? = nil, text : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[7]
      _values = StaticArray(LibGObject::Value, 7).new(LibGObject::Value.new)
      _n = 0

      if !can_redo.nil?
        (_names.to_unsafe + _n).value = "can-redo".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_redo)
        _n += 1
      end
      if !can_undo.nil?
        (_names.to_unsafe + _n).value = "can-undo".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_undo)
        _n += 1
      end
      if !cursor_position.nil?
        (_names.to_unsafe + _n).value = "cursor-position".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cursor_position)
        _n += 1
      end
      if !enable_undo.nil?
        (_names.to_unsafe + _n).value = "enable-undo".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, enable_undo)
        _n += 1
      end
      if !has_selection.nil?
        (_names.to_unsafe + _n).value = "has-selection".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_selection)
        _n += 1
      end
      if !tag_table.nil?
        (_names.to_unsafe + _n).value = "tag-table".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tag_table)
        _n += 1
      end
      if !text.nil?
        (_names.to_unsafe + _n).value = "text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, text)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TextBuffer.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
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

    # Creates a new text buffer.
    def initialize(table : Gtk::TextTagTable?)
      # gtk_text_buffer_new: (Constructor)
      # @table: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      table = if table.nil?
                Pointer(Void).null
              else
                table.to_unsafe
              end

      # C call
      _retval = LibGtk.gtk_text_buffer_new(table)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Adds the mark at position @where.
    #
    # The mark must not be added to another buffer, and if its name
    # is not %NULL then there must not be another mark in the buffer
    # with the same name.
    #
    # Emits the [signal@Gtk.TextBuffer::mark-set] signal as notification
    # of the mark's initial placement.
    def add_mark(mark : Gtk::TextMark, where : Gtk::TextIter) : Nil
      # gtk_text_buffer_add_mark: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_add_mark(self, mark, where)

      # Return value handling
    end

    # Adds @clipboard to the list of clipboards in which the selection
    # contents of @buffer are available.
    #
    # In most cases, @clipboard will be the `GdkClipboard` returned by
    # `Gtk::Widget#primary_clipboard` for a view of @buffer.
    def add_selection_clipboard(clipboard : Gdk::Clipboard) : Nil
      # gtk_text_buffer_add_selection_clipboard: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_add_selection_clipboard(self, clipboard)

      # Return value handling
    end

    # Emits the “apply-tag” signal on @buffer.
    #
    # The default handler for the signal applies
    # @tag to the given range. @start and @end do
    # not have to be in order.
    def apply_tag(tag : Gtk::TextTag, start : Gtk::TextIter, end _end : Gtk::TextIter) : Nil
      # gtk_text_buffer_apply_tag: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_apply_tag(self, tag, start, _end)

      # Return value handling
    end

    # Emits the “apply-tag” signal on @buffer.
    #
    # Calls `Gtk::TextTagTable#lookup` on the buffer’s
    # tag table to get a `GtkTextTag`, then calls
    # `Gtk::TextBuffer#apply_tag`.
    def apply_tag_by_name(name : ::String, start : Gtk::TextIter, end _end : Gtk::TextIter) : Nil
      # gtk_text_buffer_apply_tag_by_name: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_apply_tag_by_name(self, name, start, _end)

      # Return value handling
    end

    # Performs the appropriate action as if the user hit the delete
    # key with the cursor at the position specified by @iter.
    #
    # In the normal case a single character will be deleted, but when
    # combining accents are involved, more than one character can
    # be deleted, and when precomposed character and accent combinations
    # are involved, less than one character will be deleted.
    #
    # Because the buffer is modified, all outstanding iterators become
    # invalid after calling this function; however, the @iter will be
    # re-initialized to point to the location where text was deleted.
    def backspace(iter : Gtk::TextIter, interactive : Bool, default_editable : Bool) : Bool
      # gtk_text_buffer_backspace: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_buffer_backspace(self, iter, interactive, default_editable)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Denotes the beginning of an action that may not be undone.
    #
    # This will cause any previous operations in the undo/redo queue
    # to be cleared.
    #
    # This should be paired with a call to
    # `Gtk::TextBuffer#end_irreversible_action` after the irreversible
    # action has completed.
    #
    # You may nest calls to gtk_text_buffer_begin_irreversible_action()
    # and gtk_text_buffer_end_irreversible_action() pairs.
    def begin_irreversible_action : Nil
      # gtk_text_buffer_begin_irreversible_action: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_begin_irreversible_action(self)

      # Return value handling
    end

    # Called to indicate that the buffer operations between here and a
    # call to gtk_text_buffer_end_user_action() are part of a single
    # user-visible operation.
    #
    # The operations between gtk_text_buffer_begin_user_action() and
    # gtk_text_buffer_end_user_action() can then be grouped when creating
    # an undo stack. `GtkTextBuffer` maintains a count of calls to
    # gtk_text_buffer_begin_user_action() that have not been closed with
    # a call to gtk_text_buffer_end_user_action(), and emits the
    # “begin-user-action” and “end-user-action” signals only for the
    # outermost pair of calls. This allows you to build user actions
    # from other user actions.
    #
    # The “interactive” buffer mutation functions, such as
    # `Gtk::TextBuffer#insert_interactive`, automatically call
    # begin/end user action around the buffer operations they perform,
    # so there's no need to add extra calls if you user action consists
    # solely of a single call to one of those functions.
    def begin_user_action : Nil
      # gtk_text_buffer_begin_user_action: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_begin_user_action(self)

      # Return value handling
    end

    # Copies the currently-selected text to a clipboard.
    def copy_clipboard(clipboard : Gdk::Clipboard) : Nil
      # gtk_text_buffer_copy_clipboard: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_copy_clipboard(self, clipboard)

      # Return value handling
    end

    # Creates and inserts a child anchor.
    #
    # This is a convenience function which simply creates a child anchor
    # with `Gtk::TextChildAnchor.new` and inserts it into the buffer
    # with `Gtk::TextBuffer#insert_child_anchor`.
    #
    # The new anchor is owned by the buffer; no reference count is
    # returned to the caller of this function.
    def create_child_anchor(iter : Gtk::TextIter) : Gtk::TextChildAnchor
      # gtk_text_buffer_create_child_anchor: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_buffer_create_child_anchor(self, iter)

      # Return value handling

      Gtk::TextChildAnchor.new(_retval, GICrystal::Transfer::None)
    end

    # Creates a mark at position @where.
    #
    # If @mark_name is %NULL, the mark is anonymous; otherwise, the mark
    # can be retrieved by name using `Gtk::TextBuffer#mark`.
    # If a mark has left gravity, and text is inserted at the mark’s
    # current location, the mark will be moved to the left of the
    # newly-inserted text. If the mark has right gravity
    # (@left_gravity = %FALSE), the mark will end up on the right of
    # newly-inserted text. The standard left-to-right cursor is a mark
    # with right gravity (when you type, the cursor stays on the right
    # side of the text you’re typing).
    #
    # The caller of this function does not own a
    # reference to the returned `GtkTextMark`, so you can ignore the
    # return value if you like. Marks are owned by the buffer and go
    # away when the buffer does.
    #
    # Emits the [signal@Gtk.TextBuffer::mark-set] signal as notification
    # of the mark's initial placement.
    def create_mark(mark_name : ::String?, where : Gtk::TextIter, left_gravity : Bool) : Gtk::TextMark
      # gtk_text_buffer_create_mark: (Method)
      # @mark_name: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
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

    # Copies the currently-selected text to a clipboard,
    # then deletes said text if it’s editable.
    def cut_clipboard(clipboard : Gdk::Clipboard, default_editable : Bool) : Nil
      # gtk_text_buffer_cut_clipboard: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_cut_clipboard(self, clipboard, default_editable)

      # Return value handling
    end

    # Deletes text between @start and @end.
    #
    # The order of @start and @end is not actually relevant;
    # gtk_text_buffer_delete() will reorder them.
    #
    # This function actually emits the “delete-range” signal, and
    # the default handler of that signal deletes the text. Because the
    # buffer is modified, all outstanding iterators become invalid after
    # calling this function; however, the @start and @end will be
    # re-initialized to point to the location where text was deleted.
    def delete(start : Gtk::TextIter, end _end : Gtk::TextIter) : Nil
      # gtk_text_buffer_delete: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_delete(self, start, _end)

      # Return value handling
    end

    # Deletes all editable text in the given range.
    #
    # Calls `Gtk::TextBuffer#delete` for each editable
    # sub-range of [@start,@end). @start and @end are revalidated
    # to point to the location of the last deleted range, or left
    # untouched if no text was deleted.
    def delete_interactive(start_iter : Gtk::TextIter, end_iter : Gtk::TextIter, default_editable : Bool) : Bool
      # gtk_text_buffer_delete_interactive: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_buffer_delete_interactive(self, start_iter, end_iter, default_editable)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Deletes @mark, so that it’s no longer located anywhere in the
    # buffer.
    #
    # Removes the reference the buffer holds to the mark, so if
    # you haven’t called g_object_ref() on the mark, it will be freed.
    # Even if the mark isn’t freed, most operations on @mark become
    # invalid, until it gets added to a buffer again with
    # `Gtk::TextBuffer#add_mark`. Use `Gtk::TextMark#deleted`
    # to find out if a mark has been removed from its buffer.
    #
    # The [signal@Gtk.TextBuffer::mark-deleted] signal will be emitted as
    # notification after the mark is deleted.
    def delete_mark(mark : Gtk::TextMark) : Nil
      # gtk_text_buffer_delete_mark: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_delete_mark(self, mark)

      # Return value handling
    end

    # Deletes the mark named @name; the mark must exist.
    #
    # See `Gtk::TextBuffer#delete_mark` for details.
    def delete_mark_by_name(name : ::String) : Nil
      # gtk_text_buffer_delete_mark_by_name: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_delete_mark_by_name(self, name)

      # Return value handling
    end

    # Deletes the range between the “insert” and “selection_bound” marks,
    # that is, the currently-selected text.
    #
    # If @interactive is %TRUE, the editability of the selection will be
    # considered (users can’t delete uneditable text).
    def delete_selection(interactive : Bool, default_editable : Bool) : Bool
      # gtk_text_buffer_delete_selection: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_buffer_delete_selection(self, interactive, default_editable)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Denotes the end of an action that may not be undone.
    #
    # This will cause any previous operations in the undo/redo
    # queue to be cleared.
    #
    # This should be called after completing modifications to the
    # text buffer after `Gtk::TextBuffer#begin_irreversible_action`
    # was called.
    #
    # You may nest calls to gtk_text_buffer_begin_irreversible_action()
    # and gtk_text_buffer_end_irreversible_action() pairs.
    def end_irreversible_action : Nil
      # gtk_text_buffer_end_irreversible_action: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_end_irreversible_action(self)

      # Return value handling
    end

    # Ends a user-visible operation.
    #
    # Should be paired with a call to
    # `Gtk::TextBuffer#begin_user_action`.
    # See that function for a full explanation.
    def end_user_action : Nil
      # gtk_text_buffer_end_user_action: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_end_user_action(self)

      # Return value handling
    end

    # Retrieves the first and last iterators in the buffer, i.e. the
    # entire buffer lies within the range [@start,@end).
    def bounds : Gtk::TextIter
      # gtk_text_buffer_get_bounds: (Method)
      # @start: (out) (caller-allocates)
      # @end: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      start = Gtk::TextIter.new # Generator::CallerAllocatesPlan
      _end = Gtk::TextIter.new
      # C call
      LibGtk.gtk_text_buffer_get_bounds(self, start, _end)

      # Return value handling

      start
    end

    # Gets whether there is a redoable action in the history.
    def can_redo : Bool
      # gtk_text_buffer_get_can_redo: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_buffer_get_can_redo(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets whether there is an undoable action in the history.
    def can_undo : Bool
      # gtk_text_buffer_get_can_undo: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_buffer_get_can_undo(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Gets the number of characters in the buffer.
    #
    # Note that characters and bytes are not the same, you can’t e.g.
    # expect the contents of the buffer in string form to be this
    # many bytes long.
    #
    # The character count is cached, so this function is very fast.
    def char_count : Int32
      # gtk_text_buffer_get_char_count: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_buffer_get_char_count(self)

      # Return value handling

      _retval
    end

    # Gets whether the buffer is saving modifications to the buffer
    # to allow for undo and redo actions.
    #
    # See `Gtk::TextBuffer#begin_irreversible_action` and
    # `Gtk::TextBuffer#end_irreversible_action` to create
    # changes to the buffer that cannot be undone.
    def enable_undo : Bool
      # gtk_text_buffer_get_enable_undo: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_buffer_get_enable_undo(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Initializes @iter with the “end iterator,” one past the last valid
    # character in the text buffer.
    #
    # If dereferenced with `Gtk::TextIter#char`, the end
    # iterator has a character value of 0.
    # The entire buffer lies in the range from the first position in
    # the buffer (call `Gtk::TextBuffer#start_iter` to get
    # character position 0) to the end iterator.
    def end_iter : Gtk::TextIter
      # gtk_text_buffer_get_end_iter: (Method)
      # @iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      iter = Gtk::TextIter.new
      # C call
      LibGtk.gtk_text_buffer_get_end_iter(self, iter)

      # Return value handling

      iter
    end

    # Indicates whether the buffer has some text currently selected.
    def has_selection : Bool
      # gtk_text_buffer_get_has_selection: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_buffer_get_has_selection(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the mark that represents the cursor (insertion point).
    #
    # Equivalent to calling `Gtk::TextBuffer#mark`
    # to get the mark named “insert”, but very slightly more
    # efficient, and involves less typing.
    def insert : Gtk::TextMark
      # gtk_text_buffer_get_insert: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_buffer_get_insert(self)

      # Return value handling

      Gtk::TextMark.new(_retval, GICrystal::Transfer::None)
    end

    # Obtains the location of @anchor within @buffer.
    def iter_at_child_anchor(anchor : Gtk::TextChildAnchor) : Gtk::TextIter
      # gtk_text_buffer_get_iter_at_child_anchor: (Method)
      # @iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      iter = Gtk::TextIter.new
      # C call
      LibGtk.gtk_text_buffer_get_iter_at_child_anchor(self, iter, anchor)

      # Return value handling

      iter
    end

    # Initializes @iter to the start of the given line.
    #
    # If @line_number is greater than or equal to the number of lines
    # in the @buffer, the end iterator is returned.
    def iter_at_line(line_number : Int32) : Gtk::TextIter
      # gtk_text_buffer_get_iter_at_line: (Method)
      # @iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      iter = Gtk::TextIter.new
      # C call
      _retval = LibGtk.gtk_text_buffer_get_iter_at_line(self, iter, line_number)

      # Return value handling

      iter
    end

    # Obtains an iterator pointing to @byte_index within the given line.
    #
    # @byte_index must be the start of a UTF-8 character. Note bytes, not
    # characters; UTF-8 may encode one character as multiple bytes.
    #
    # If @line_number is greater than or equal to the number of lines in the @buffer,
    # the end iterator is returned. And if @byte_index is off the
    # end of the line, the iterator at the end of the line is returned.
    def iter_at_line_index(line_number : Int32, byte_index : Int32) : Gtk::TextIter
      # gtk_text_buffer_get_iter_at_line_index: (Method)
      # @iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      iter = Gtk::TextIter.new
      # C call
      _retval = LibGtk.gtk_text_buffer_get_iter_at_line_index(self, iter, line_number, byte_index)

      # Return value handling

      iter
    end

    # Obtains an iterator pointing to @char_offset within the given line.
    #
    # Note characters, not bytes; UTF-8 may encode one character as multiple
    # bytes.
    #
    # If @line_number is greater than or equal to the number of lines in the @buffer,
    # the end iterator is returned. And if @char_offset is off the
    # end of the line, the iterator at the end of the line is returned.
    def iter_at_line_offset(line_number : Int32, char_offset : Int32) : Gtk::TextIter
      # gtk_text_buffer_get_iter_at_line_offset: (Method)
      # @iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      iter = Gtk::TextIter.new
      # C call
      _retval = LibGtk.gtk_text_buffer_get_iter_at_line_offset(self, iter, line_number, char_offset)

      # Return value handling

      iter
    end

    # Initializes @iter with the current position of @mark.
    def iter_at_mark(mark : Gtk::TextMark) : Gtk::TextIter
      # gtk_text_buffer_get_iter_at_mark: (Method)
      # @iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      iter = Gtk::TextIter.new
      # C call
      LibGtk.gtk_text_buffer_get_iter_at_mark(self, iter, mark)

      # Return value handling

      iter
    end

    # Initializes @iter to a position @char_offset chars from the start
    # of the entire buffer.
    #
    # If @char_offset is -1 or greater than the number
    # of characters in the buffer, @iter is initialized to the end iterator,
    # the iterator one past the last valid character in the buffer.
    def iter_at_offset(char_offset : Int32) : Gtk::TextIter
      # gtk_text_buffer_get_iter_at_offset: (Method)
      # @iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      iter = Gtk::TextIter.new
      # C call
      LibGtk.gtk_text_buffer_get_iter_at_offset(self, iter, char_offset)

      # Return value handling

      iter
    end

    # Obtains the number of lines in the buffer.
    #
    # This value is cached, so the function is very fast.
    def line_count : Int32
      # gtk_text_buffer_get_line_count: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_buffer_get_line_count(self)

      # Return value handling

      _retval
    end

    # Returns the mark named @name in buffer @buffer, or %NULL if no such
    # mark exists in the buffer.
    def mark(name : ::String) : Gtk::TextMark?
      # gtk_text_buffer_get_mark: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_buffer_get_mark(self, name)

      # Return value handling

      Gtk::TextMark.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the maximum number of undo levels to perform.
    #
    # If 0, unlimited undo actions may be performed. Note that this may
    # have a memory usage impact as it requires storing an additional
    # copy of the inserted or removed text within the text buffer.
    def max_undo_levels : UInt32
      # gtk_text_buffer_get_max_undo_levels: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_buffer_get_max_undo_levels(self)

      # Return value handling

      _retval
    end

    # Indicates whether the buffer has been modified since the last call
    # to `Gtk::TextBuffer#modified=` set the modification flag to
    # %FALSE.
    #
    # Used for example to enable a “save” function in a text editor.
    def modified : Bool
      # gtk_text_buffer_get_modified: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_buffer_get_modified(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the mark that represents the selection bound.
    #
    # Equivalent to calling `Gtk::TextBuffer#mark`
    # to get the mark named “selection_bound”, but very slightly
    # more efficient, and involves less typing.
    #
    # The currently-selected text in @buffer is the region between the
    # “selection_bound” and “insert” marks. If “selection_bound” and
    # “insert” are in the same place, then there is no current selection.
    # `Gtk::TextBuffer#selection_bounds` is another convenient
    # function for handling the selection, if you just want to know whether
    # there’s a selection and what its bounds are.
    def selection_bound : Gtk::TextMark
      # gtk_text_buffer_get_selection_bound: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_buffer_get_selection_bound(self)

      # Return value handling

      Gtk::TextMark.new(_retval, GICrystal::Transfer::None)
    end

    # Returns %TRUE if some text is selected; places the bounds
    # of the selection in @start and @end.
    #
    # If the selection has length 0, then @start and @end are filled
    # in with the same value. @start and @end will be in ascending order.
    # If @start and @end are %NULL, then they are not filled in, but the
    # return value still indicates whether text is selected.
    def selection_bounds : Gtk::TextIter
      # gtk_text_buffer_get_selection_bounds: (Method)
      # @start: (out) (caller-allocates)
      # @end: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      start = Gtk::TextIter.new # Generator::CallerAllocatesPlan
      _end = Gtk::TextIter.new
      # C call
      _retval = LibGtk.gtk_text_buffer_get_selection_bounds(self, start, _end)

      # Return value handling

      start
    end

    # Get a content provider for this buffer.
    #
    # It can be used to make the content of @buffer available
    # in a `GdkClipboard`, see `Gdk::Clipboard#content=`.
    def selection_content : Gdk::ContentProvider
      # gtk_text_buffer_get_selection_content: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_text_buffer_get_selection_content(self)

      # Return value handling

      Gdk::ContentProvider.new(_retval, GICrystal::Transfer::Full)
    end

    # Returns the text in the range [@start,@end).
    #
    # Excludes undisplayed text (text marked with tags that set the
    # invisibility attribute) if @include_hidden_chars is %FALSE.
    # The returned string includes a 0xFFFC character whenever the
    # buffer contains embedded images, so byte and character indexes
    # into the returned string do correspond to byte and character
    # indexes into the buffer. Contrast with `Gtk::TextBuffer#text`.
    # Note that 0xFFFC can occur in normal text as well, so it is not a
    # reliable indicator that a paintable or widget is in the buffer.
    def slice(start : Gtk::TextIter, end _end : Gtk::TextIter, include_hidden_chars : Bool) : ::String
      # gtk_text_buffer_get_slice: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_text_buffer_get_slice(self, start, _end, include_hidden_chars)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    # Initialized @iter with the first position in the text buffer.
    #
    # This is the same as using `Gtk::TextBuffer#iter_at_offset`
    # to get the iter at character offset 0.
    def start_iter : Gtk::TextIter
      # gtk_text_buffer_get_start_iter: (Method)
      # @iter: (out) (caller-allocates)
      # Returns: (transfer none)

      # Generator::CallerAllocatesPlan
      iter = Gtk::TextIter.new
      # C call
      LibGtk.gtk_text_buffer_get_start_iter(self, iter)

      # Return value handling

      iter
    end

    # Get the `GtkTextTagTable` associated with this buffer.
    def tag_table : Gtk::TextTagTable
      # gtk_text_buffer_get_tag_table: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_buffer_get_tag_table(self)

      # Return value handling

      Gtk::TextTagTable.new(_retval, GICrystal::Transfer::None)
    end

    # Returns the text in the range [@start,@end).
    #
    # Excludes undisplayed text (text marked with tags that set the
    # invisibility attribute) if @include_hidden_chars is %FALSE.
    # Does not include characters representing embedded images, so
    # byte and character indexes into the returned string do not
    # correspond to byte and character indexes into the buffer.
    # Contrast with `Gtk::TextBuffer#slice`.
    def text(start : Gtk::TextIter, end _end : Gtk::TextIter, include_hidden_chars : Bool) : ::String
      # gtk_text_buffer_get_text: (Method | Getter)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_text_buffer_get_text(self, start, _end, include_hidden_chars)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    # Inserts @len bytes of @text at position @iter.
    #
    # If @len is -1, @text must be nul-terminated and will be inserted in its
    # entirety. Emits the “insert-text” signal; insertion actually occurs
    # in the default handler for the signal. @iter is invalidated when
    # insertion occurs (because the buffer contents change), but the
    # default signal handler revalidates it to point to the end of the
    # inserted text.
    def insert(iter : Gtk::TextIter, text : ::String, len : Int32) : Nil
      # gtk_text_buffer_insert: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_insert(self, iter, text, len)

      # Return value handling
    end

    # Inserts @text in @buffer.
    #
    # Simply calls `Gtk::TextBuffer#insert`,
    # using the current cursor position as the insertion point.
    def insert_at_cursor(text : ::String, len : Int32) : Nil
      # gtk_text_buffer_insert_at_cursor: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_insert_at_cursor(self, text, len)

      # Return value handling
    end

    # Inserts a child widget anchor into the text buffer at @iter.
    #
    # The anchor will be counted as one character in character counts, and
    # when obtaining the buffer contents as a string, will be represented
    # by the Unicode “object replacement character” 0xFFFC. Note that the
    # “slice” variants for obtaining portions of the buffer as a string
    # include this character for child anchors, but the “text” variants do
    # not. E.g. see `Gtk::TextBuffer#slice` and
    # `Gtk::TextBuffer#text`.
    #
    # Consider `Gtk::TextBuffer#create_child_anchor` as a more
    # convenient alternative to this function. The buffer will add a
    # reference to the anchor, so you can unref it after insertion.
    def insert_child_anchor(iter : Gtk::TextIter, anchor : Gtk::TextChildAnchor) : Nil
      # gtk_text_buffer_insert_child_anchor: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_insert_child_anchor(self, iter, anchor)

      # Return value handling
    end

    # Inserts @text in @buffer.
    #
    # Like `Gtk::TextBuffer#insert`, but the insertion will not occur
    # if @iter is at a non-editable location in the buffer. Usually you
    # want to prevent insertions at ineditable locations if the insertion
    # results from a user action (is interactive).
    #
    # @default_editable indicates the editability of text that doesn't
    # have a tag affecting editability applied to it. Typically the
    # result of `Gtk::TextView#editable` is appropriate here.
    def insert_interactive(iter : Gtk::TextIter, text : ::String, len : Int32, default_editable : Bool) : Bool
      # gtk_text_buffer_insert_interactive: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_buffer_insert_interactive(self, iter, text, len, default_editable)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Inserts @text in @buffer.
    #
    # Calls `Gtk::TextBuffer#insert_interactive`
    # at the cursor position.
    #
    # @default_editable indicates the editability of text that doesn't
    # have a tag affecting editability applied to it. Typically the
    # result of `Gtk::TextView#editable` is appropriate here.
    def insert_interactive_at_cursor(text : ::String, len : Int32, default_editable : Bool) : Bool
      # gtk_text_buffer_insert_interactive_at_cursor: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_buffer_insert_interactive_at_cursor(self, text, len, default_editable)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Inserts the text in @markup at position @iter.
    #
    # @markup will be inserted in its entirety and must be nul-terminated
    # and valid UTF-8. Emits the [signal@Gtk.TextBuffer::insert-text] signal,
    # possibly multiple times; insertion actually occurs in the default handler
    # for the signal. @iter will point to the end of the inserted text on return.
    def insert_markup(iter : Gtk::TextIter, markup : ::String, len : Int32) : Nil
      # gtk_text_buffer_insert_markup: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_insert_markup(self, iter, markup, len)

      # Return value handling
    end

    # Inserts an image into the text buffer at @iter.
    #
    # The image will be counted as one character in character counts,
    # and when obtaining the buffer contents as a string, will be
    # represented by the Unicode “object replacement character” 0xFFFC.
    # Note that the “slice” variants for obtaining portions of the buffer
    # as a string include this character for paintable, but the “text”
    # variants do not. e.g. see `Gtk::TextBuffer#slice` and
    # `Gtk::TextBuffer#text`.
    def insert_paintable(iter : Gtk::TextIter, paintable : Gdk::Paintable) : Nil
      # gtk_text_buffer_insert_paintable: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_insert_paintable(self, iter, paintable)

      # Return value handling
    end

    # Copies text, tags, and paintables between @start and @end
    # and inserts the copy at @iter.
    #
    # The order of @start and @end doesn’t matter.
    #
    # Used instead of simply getting/inserting text because it preserves
    # images and tags. If @start and @end are in a different buffer from
    # @buffer, the two buffers must share the same tag table.
    #
    # Implemented via emissions of the ::insert-text and ::apply-tag signals,
    # so expect those.
    def insert_range(iter : Gtk::TextIter, start : Gtk::TextIter, end _end : Gtk::TextIter) : Nil
      # gtk_text_buffer_insert_range: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_insert_range(self, iter, start, _end)

      # Return value handling
    end

    # Copies text, tags, and paintables between @start and @end
    # and inserts the copy at @iter.
    #
    # Same as `Gtk::TextBuffer#insert_range`, but does nothing
    # if the insertion point isn’t editable. The @default_editable
    # parameter indicates whether the text is editable at @iter if
    # no tags enclosing @iter affect editability. Typically the result
    # of `Gtk::TextView#editable` is appropriate here.
    def insert_range_interactive(iter : Gtk::TextIter, start : Gtk::TextIter, end _end : Gtk::TextIter, default_editable : Bool) : Bool
      # gtk_text_buffer_insert_range_interactive: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_buffer_insert_range_interactive(self, iter, start, _end, default_editable)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Moves @mark to the new location @where.
    #
    # Emits the [signal@Gtk.TextBuffer::mark-set] signal
    # as notification of the move.
    def move_mark(mark : Gtk::TextMark, where : Gtk::TextIter) : Nil
      # gtk_text_buffer_move_mark: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_move_mark(self, mark, where)

      # Return value handling
    end

    # Moves the mark named @name (which must exist) to location @where.
    #
    # See `Gtk::TextBuffer#move_mark` for details.
    def move_mark_by_name(name : ::String, where : Gtk::TextIter) : Nil
      # gtk_text_buffer_move_mark_by_name: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_move_mark_by_name(self, name, where)

      # Return value handling
    end

    # Pastes the contents of a clipboard.
    #
    # If @override_location is %NULL, the pasted text will be inserted
    # at the cursor position, or the buffer selection will be replaced
    # if the selection is non-empty.
    #
    # Note: pasting is asynchronous, that is, we’ll ask for the paste data
    # and return, and at some point later after the main loop runs, the paste
    # data will be inserted.
    def paste_clipboard(clipboard : Gdk::Clipboard, override_location : Gtk::TextIter?, default_editable : Bool) : Nil
      # gtk_text_buffer_paste_clipboard: (Method)
      # @override_location: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      override_location = if override_location.nil?
                            Pointer(Void).null
                          else
                            override_location.to_unsafe
                          end

      # C call
      LibGtk.gtk_text_buffer_paste_clipboard(self, clipboard, override_location, default_editable)

      # Return value handling
    end

    # This function moves the “insert” and “selection_bound” marks
    # simultaneously.
    #
    # If you move them to the same place in two steps with
    # `Gtk::TextBuffer#move_mark`, you will temporarily select a
    # region in between their old and new locations, which can be pretty
    # inefficient since the temporarily-selected region will force stuff
    # to be recalculated. This function moves them as a unit, which can
    # be optimized.
    def place_cursor(where : Gtk::TextIter) : Nil
      # gtk_text_buffer_place_cursor: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_place_cursor(self, where)

      # Return value handling
    end

    # Redoes the next redoable action on the buffer, if there is one.
    def redo : Nil
      # gtk_text_buffer_redo: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_redo(self)

      # Return value handling
    end

    # Removes all tags in the range between @start and @end.
    #
    # Be careful with this function; it could remove tags added in code
    # unrelated to the code you’re currently writing. That is, using this
    # function is probably a bad idea if you have two or more unrelated
    # code sections that add tags.
    def remove_all_tags(start : Gtk::TextIter, end _end : Gtk::TextIter) : Nil
      # gtk_text_buffer_remove_all_tags: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_remove_all_tags(self, start, _end)

      # Return value handling
    end

    # Removes a `GdkClipboard` added with
    # gtk_text_buffer_add_selection_clipboard().
    def remove_selection_clipboard(clipboard : Gdk::Clipboard) : Nil
      # gtk_text_buffer_remove_selection_clipboard: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_remove_selection_clipboard(self, clipboard)

      # Return value handling
    end

    # Emits the “remove-tag” signal.
    #
    # The default handler for the signal removes all occurrences
    # of @tag from the given range. @start and @end don’t have
    # to be in order.
    def remove_tag(tag : Gtk::TextTag, start : Gtk::TextIter, end _end : Gtk::TextIter) : Nil
      # gtk_text_buffer_remove_tag: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_remove_tag(self, tag, start, _end)

      # Return value handling
    end

    # Emits the “remove-tag” signal.
    #
    # Calls `Gtk::TextTagTable#lookup` on the buffer’s
    # tag table to get a `GtkTextTag`, then calls
    # `Gtk::TextBuffer#remove_tag`.
    def remove_tag_by_name(name : ::String, start : Gtk::TextIter, end _end : Gtk::TextIter) : Nil
      # gtk_text_buffer_remove_tag_by_name: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_remove_tag_by_name(self, name, start, _end)

      # Return value handling
    end

    # This function moves the “insert” and “selection_bound” marks
    # simultaneously.
    #
    # If you move them in two steps with
    # `Gtk::TextBuffer#move_mark`, you will temporarily select a
    # region in between their old and new locations, which can be pretty
    # inefficient since the temporarily-selected region will force stuff
    # to be recalculated. This function moves them as a unit, which can
    # be optimized.
    def select_range(ins : Gtk::TextIter, bound : Gtk::TextIter) : Nil
      # gtk_text_buffer_select_range: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_select_range(self, ins, bound)

      # Return value handling
    end

    # Sets whether or not to enable undoable actions in the text buffer.
    #
    # Undoable actions in this context are changes to the text content of
    # the buffer. Changes to tags and marks are not tracked.
    #
    # If enabled, the user will be able to undo the last number of actions
    # up to `Gtk::TextBuffer#max_undo_levels`.
    #
    # See `Gtk::TextBuffer#begin_irreversible_action` and
    # `Gtk::TextBuffer#end_irreversible_action` to create
    # changes to the buffer that cannot be undone.
    def enable_undo=(enable_undo : Bool) : Nil
      # gtk_text_buffer_set_enable_undo: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_set_enable_undo(self, enable_undo)

      # Return value handling
    end

    # Sets the maximum number of undo levels to perform.
    #
    # If 0, unlimited undo actions may be performed. Note that this may
    # have a memory usage impact as it requires storing an additional
    # copy of the inserted or removed text within the text buffer.
    def max_undo_levels=(max_undo_levels : UInt32) : Nil
      # gtk_text_buffer_set_max_undo_levels: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_set_max_undo_levels(self, max_undo_levels)

      # Return value handling
    end

    # Used to keep track of whether the buffer has been
    # modified since the last time it was saved.
    #
    # Whenever the buffer is saved to disk, call
    # `gtk_text_buffer_set_modified (@buffer, FALSE)`.
    # When the buffer is modified, it will automatically
    # toggled on the modified bit again. When the modified
    # bit flips, the buffer emits the
    # [signal@Gtk.TextBuffer::modified-changed] signal.
    def modified=(setting : Bool) : Nil
      # gtk_text_buffer_set_modified: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_set_modified(self, setting)

      # Return value handling
    end

    # Deletes current contents of @buffer, and inserts @text instead.
    #
    # If @len is -1, @text must be nul-terminated.
    # @text must be valid UTF-8.
    def set_text(text : ::String, len : Int32) : Nil
      # gtk_text_buffer_set_text: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_set_text(self, text, len)

      # Return value handling
    end

    # Undoes the last undoable action on the buffer, if there is one.
    def undo : Nil
      # gtk_text_buffer_undo: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_buffer_undo(self)

      # Return value handling
    end

    # Emitted to apply a tag to a range of text in a `GtkTextBuffer`.
    #
    # Applying actually occurs in the default handler.
    #
    # Note that if your handler runs before the default handler
    # it must not invalidate the @start and @end iters (or has to
    # revalidate them).
    #
    # See also:
    # `Gtk::TextBuffer#apply_tag`,
    # `Gtk::TextBuffer#insert_with_tags`,
    # `Gtk::TextBuffer#insert_range`.
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

      def connect(handler : Proc(Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_tag : Pointer(Void), lib_start : Pointer(Void), lib__end : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          tag = Gtk::TextTag.new(lib_tag, :none)
          # Generator::GObjectArgPlan
          start = Gtk::TextIter.new(lib_start, :none)
          # Generator::GObjectArgPlan
          _end = Gtk::TextIter.new(lib__end, :none)
          ::Box(Proc(Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil)).unbox(_lib_box).call(tag, start, _end)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_tag : Pointer(Void), lib_start : Pointer(Void), lib__end : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          tag = Gtk::TextTag.new(lib_tag, :none)
          # Generator::GObjectArgPlan
          start = Gtk::TextIter.new(lib_start, :none)
          # Generator::GObjectArgPlan
          _end = Gtk::TextIter.new(lib__end, :none)
          ::Box(Proc(Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil)).unbox(_lib_box).call(tag, start, _end)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TextBuffer, Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_tag : Pointer(Void), lib_start : Pointer(Void), lib__end : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextBuffer.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          tag = Gtk::TextTag.new(lib_tag, :none)
          # Generator::GObjectArgPlan
          start = Gtk::TextIter.new(lib_start, :none)
          # Generator::GObjectArgPlan
          _end = Gtk::TextIter.new(lib__end, :none)
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil)).unbox(_lib_box).call(_sender, tag, start, _end)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextBuffer, Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_tag : Pointer(Void), lib_start : Pointer(Void), lib__end : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextBuffer.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          tag = Gtk::TextTag.new(lib_tag, :none)
          # Generator::GObjectArgPlan
          start = Gtk::TextIter.new(lib_start, :none)
          # Generator::GObjectArgPlan
          _end = Gtk::TextIter.new(lib__end, :none)
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil)).unbox(_lib_box).call(_sender, tag, start, _end)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(tag : Gtk::TextTag, start : Gtk::TextIter, _end : Gtk::TextIter) : Nil
        LibGObject.g_signal_emit_by_name(@source, "apply-tag", tag, start, _end)
      end
    end

    def apply_tag_signal
      ApplyTagSignal.new(self)
    end

    # Emitted at the beginning of a single user-visible
    # operation on a `GtkTextBuffer`.
    #
    # See also:
    # `Gtk::TextBuffer#begin_user_action`,
    # `Gtk::TextBuffer#insert_interactive`,
    # `Gtk::TextBuffer#insert_range_interactive`,
    # `Gtk::TextBuffer#delete_interactive`,
    # `Gtk::TextBuffer#backspace`,
    # `Gtk::TextBuffer#delete_selection`.
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

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TextBuffer, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextBuffer.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextBuffer, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextBuffer.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "begin-user-action")
      end
    end

    def begin_user_action_signal
      BeginUserActionSignal.new(self)
    end

    # Emitted when the content of a `GtkTextBuffer` has changed.
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

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TextBuffer, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextBuffer.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextBuffer, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextBuffer.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "changed")
      end
    end

    def changed_signal
      ChangedSignal.new(self)
    end

    # Emitted to delete a range from a `GtkTextBuffer`.
    #
    # Note that if your handler runs before the default handler
    # it must not invalidate the @start and @end iters (or has
    # to revalidate them). The default signal handler revalidates
    # the @start and @end iters to both point to the location
    # where text was deleted. Handlers which run after the default
    # handler (see g_signal_connect_after()) do not have access to
    # the deleted text.
    #
    # See also: `Gtk::TextBuffer#delete`.
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

      def connect(handler : Proc(Gtk::TextIter, Gtk::TextIter, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_start : Pointer(Void), lib__end : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          start = Gtk::TextIter.new(lib_start, :none)
          # Generator::GObjectArgPlan
          _end = Gtk::TextIter.new(lib__end, :none)
          ::Box(Proc(Gtk::TextIter, Gtk::TextIter, Nil)).unbox(_lib_box).call(start, _end)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextIter, Gtk::TextIter, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_start : Pointer(Void), lib__end : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          start = Gtk::TextIter.new(lib_start, :none)
          # Generator::GObjectArgPlan
          _end = Gtk::TextIter.new(lib__end, :none)
          ::Box(Proc(Gtk::TextIter, Gtk::TextIter, Nil)).unbox(_lib_box).call(start, _end)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TextBuffer, Gtk::TextIter, Gtk::TextIter, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_start : Pointer(Void), lib__end : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextBuffer.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          start = Gtk::TextIter.new(lib_start, :none)
          # Generator::GObjectArgPlan
          _end = Gtk::TextIter.new(lib__end, :none)
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextIter, Gtk::TextIter, Nil)).unbox(_lib_box).call(_sender, start, _end)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextBuffer, Gtk::TextIter, Gtk::TextIter, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_start : Pointer(Void), lib__end : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextBuffer.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          start = Gtk::TextIter.new(lib_start, :none)
          # Generator::GObjectArgPlan
          _end = Gtk::TextIter.new(lib__end, :none)
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextIter, Gtk::TextIter, Nil)).unbox(_lib_box).call(_sender, start, _end)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(start : Gtk::TextIter, _end : Gtk::TextIter) : Nil
        LibGObject.g_signal_emit_by_name(@source, "delete-range", start, _end)
      end
    end

    def delete_range_signal
      DeleteRangeSignal.new(self)
    end

    # Emitted at the end of a single user-visible
    # operation on the `GtkTextBuffer`.
    #
    # See also:
    # `Gtk::TextBuffer#end_user_action`,
    # `Gtk::TextBuffer#insert_interactive`,
    # `Gtk::TextBuffer#insert_range_interactive`,
    # `Gtk::TextBuffer#delete_interactive`,
    # `Gtk::TextBuffer#backspace`,
    # `Gtk::TextBuffer#delete_selection`,
    # `Gtk::TextBuffer#backspace`.
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

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TextBuffer, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextBuffer.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextBuffer, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextBuffer.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "end-user-action")
      end
    end

    def end_user_action_signal
      EndUserActionSignal.new(self)
    end

    # Emitted to insert a `GtkTextChildAnchor` in a `GtkTextBuffer`.
    #
    # Insertion actually occurs in the default handler.
    #
    # Note that if your handler runs before the default handler
    # it must not invalidate the @location iter (or has to
    # revalidate it). The default signal handler revalidates
    # it to be placed after the inserted @anchor.
    #
    # See also: `Gtk::TextBuffer#insert_child_anchor`.
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

      def connect(handler : Proc(Gtk::TextIter, Gtk::TextChildAnchor, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_location : Pointer(Void), lib_anchor : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          location = Gtk::TextIter.new(lib_location, :none)
          # Generator::GObjectArgPlan
          anchor = Gtk::TextChildAnchor.new(lib_anchor, :none)
          ::Box(Proc(Gtk::TextIter, Gtk::TextChildAnchor, Nil)).unbox(_lib_box).call(location, anchor)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextIter, Gtk::TextChildAnchor, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_location : Pointer(Void), lib_anchor : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          location = Gtk::TextIter.new(lib_location, :none)
          # Generator::GObjectArgPlan
          anchor = Gtk::TextChildAnchor.new(lib_anchor, :none)
          ::Box(Proc(Gtk::TextIter, Gtk::TextChildAnchor, Nil)).unbox(_lib_box).call(location, anchor)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TextBuffer, Gtk::TextIter, Gtk::TextChildAnchor, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_location : Pointer(Void), lib_anchor : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextBuffer.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          location = Gtk::TextIter.new(lib_location, :none)
          # Generator::GObjectArgPlan
          anchor = Gtk::TextChildAnchor.new(lib_anchor, :none)
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextIter, Gtk::TextChildAnchor, Nil)).unbox(_lib_box).call(_sender, location, anchor)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextBuffer, Gtk::TextIter, Gtk::TextChildAnchor, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_location : Pointer(Void), lib_anchor : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextBuffer.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          location = Gtk::TextIter.new(lib_location, :none)
          # Generator::GObjectArgPlan
          anchor = Gtk::TextChildAnchor.new(lib_anchor, :none)
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextIter, Gtk::TextChildAnchor, Nil)).unbox(_lib_box).call(_sender, location, anchor)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(location : Gtk::TextIter, anchor : Gtk::TextChildAnchor) : Nil
        LibGObject.g_signal_emit_by_name(@source, "insert-child-anchor", location, anchor)
      end
    end

    def insert_child_anchor_signal
      InsertChildAnchorSignal.new(self)
    end

    # Emitted to insert a `GdkPaintable` in a `GtkTextBuffer`.
    #
    # Insertion actually occurs in the default handler.
    #
    # Note that if your handler runs before the default handler
    # it must not invalidate the @location iter (or has to
    # revalidate it). The default signal handler revalidates
    # it to be placed after the inserted @paintable.
    #
    # See also: `Gtk::TextBuffer#insert_paintable`.
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

      def connect(handler : Proc(Gtk::TextIter, Gdk::Paintable, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_location : Pointer(Void), lib_paintable : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          location = Gtk::TextIter.new(lib_location, :none)
          # Generator::GObjectArgPlan
          paintable = Gdk::Paintable.new(lib_paintable, :none)
          ::Box(Proc(Gtk::TextIter, Gdk::Paintable, Nil)).unbox(_lib_box).call(location, paintable)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextIter, Gdk::Paintable, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_location : Pointer(Void), lib_paintable : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          location = Gtk::TextIter.new(lib_location, :none)
          # Generator::GObjectArgPlan
          paintable = Gdk::Paintable.new(lib_paintable, :none)
          ::Box(Proc(Gtk::TextIter, Gdk::Paintable, Nil)).unbox(_lib_box).call(location, paintable)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TextBuffer, Gtk::TextIter, Gdk::Paintable, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_location : Pointer(Void), lib_paintable : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextBuffer.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          location = Gtk::TextIter.new(lib_location, :none)
          # Generator::GObjectArgPlan
          paintable = Gdk::Paintable.new(lib_paintable, :none)
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextIter, Gdk::Paintable, Nil)).unbox(_lib_box).call(_sender, location, paintable)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextBuffer, Gtk::TextIter, Gdk::Paintable, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_location : Pointer(Void), lib_paintable : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextBuffer.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          location = Gtk::TextIter.new(lib_location, :none)
          # Generator::GObjectArgPlan
          paintable = Gdk::Paintable.new(lib_paintable, :none)
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextIter, Gdk::Paintable, Nil)).unbox(_lib_box).call(_sender, location, paintable)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(location : Gtk::TextIter, paintable : Gdk::Paintable) : Nil
        LibGObject.g_signal_emit_by_name(@source, "insert-paintable", location, paintable)
      end
    end

    def insert_paintable_signal
      InsertPaintableSignal.new(self)
    end

    # Emitted to insert text in a `GtkTextBuffer`.
    #
    # Insertion actually occurs in the default handler.
    #
    # Note that if your handler runs before the default handler
    # it must not invalidate the @location iter (or has to
    # revalidate it). The default signal handler revalidates
    # it to point to the end of the inserted text.
    #
    # See also: `Gtk::TextBuffer#insert`,
    # `Gtk::TextBuffer#insert_range`.
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

      def connect(handler : Proc(Gtk::TextIter, ::String, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_location : Pointer(Void), lib_text : Pointer(LibC::Char), lib_len : Int32, _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          location = Gtk::TextIter.new(lib_location, :none)
          text = lib_text
          len = lib_len
          ::Box(Proc(Gtk::TextIter, ::String, Int32, Nil)).unbox(_lib_box).call(location, text, len)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextIter, ::String, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_location : Pointer(Void), lib_text : Pointer(LibC::Char), lib_len : Int32, _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          location = Gtk::TextIter.new(lib_location, :none)
          text = lib_text
          len = lib_len
          ::Box(Proc(Gtk::TextIter, ::String, Int32, Nil)).unbox(_lib_box).call(location, text, len)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TextBuffer, Gtk::TextIter, ::String, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_location : Pointer(Void), lib_text : Pointer(LibC::Char), lib_len : Int32, _lib_box : Pointer(Void)) {
          _sender = Gtk::TextBuffer.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          location = Gtk::TextIter.new(lib_location, :none)
          text = lib_text
          len = lib_len
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextIter, ::String, Int32, Nil)).unbox(_lib_box).call(_sender, location, text, len)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextBuffer, Gtk::TextIter, ::String, Int32, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_location : Pointer(Void), lib_text : Pointer(LibC::Char), lib_len : Int32, _lib_box : Pointer(Void)) {
          _sender = Gtk::TextBuffer.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          location = Gtk::TextIter.new(lib_location, :none)
          text = lib_text
          len = lib_len
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextIter, ::String, Int32, Nil)).unbox(_lib_box).call(_sender, location, text, len)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(location : Gtk::TextIter, text : ::String, len : Int32) : Nil
        LibGObject.g_signal_emit_by_name(@source, "insert-text", location, text, len)
      end
    end

    def insert_text_signal
      InsertTextSignal.new(self)
    end

    # Emitted as notification after a `GtkTextMark` is deleted.
    #
    # See also: `Gtk::TextBuffer#delete_mark`.
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

      def connect(handler : Proc(Gtk::TextMark, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_mark : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          mark = Gtk::TextMark.new(lib_mark, :none)
          ::Box(Proc(Gtk::TextMark, Nil)).unbox(_lib_box).call(mark)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextMark, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_mark : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          mark = Gtk::TextMark.new(lib_mark, :none)
          ::Box(Proc(Gtk::TextMark, Nil)).unbox(_lib_box).call(mark)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TextBuffer, Gtk::TextMark, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_mark : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextBuffer.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          mark = Gtk::TextMark.new(lib_mark, :none)
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextMark, Nil)).unbox(_lib_box).call(_sender, mark)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextBuffer, Gtk::TextMark, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_mark : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextBuffer.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          mark = Gtk::TextMark.new(lib_mark, :none)
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextMark, Nil)).unbox(_lib_box).call(_sender, mark)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(mark : Gtk::TextMark) : Nil
        LibGObject.g_signal_emit_by_name(@source, "mark-deleted", mark)
      end
    end

    def mark_deleted_signal
      MarkDeletedSignal.new(self)
    end

    # Emitted as notification after a `GtkTextMark` is set.
    #
    # See also:
    # `Gtk::TextBuffer#create_mark`,
    # `Gtk::TextBuffer#move_mark`.
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

      def connect(handler : Proc(Gtk::TextIter, Gtk::TextMark, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_location : Pointer(Void), lib_mark : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          location = Gtk::TextIter.new(lib_location, :none)
          # Generator::GObjectArgPlan
          mark = Gtk::TextMark.new(lib_mark, :none)
          ::Box(Proc(Gtk::TextIter, Gtk::TextMark, Nil)).unbox(_lib_box).call(location, mark)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextIter, Gtk::TextMark, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_location : Pointer(Void), lib_mark : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          location = Gtk::TextIter.new(lib_location, :none)
          # Generator::GObjectArgPlan
          mark = Gtk::TextMark.new(lib_mark, :none)
          ::Box(Proc(Gtk::TextIter, Gtk::TextMark, Nil)).unbox(_lib_box).call(location, mark)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TextBuffer, Gtk::TextIter, Gtk::TextMark, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_location : Pointer(Void), lib_mark : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextBuffer.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          location = Gtk::TextIter.new(lib_location, :none)
          # Generator::GObjectArgPlan
          mark = Gtk::TextMark.new(lib_mark, :none)
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextIter, Gtk::TextMark, Nil)).unbox(_lib_box).call(_sender, location, mark)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextBuffer, Gtk::TextIter, Gtk::TextMark, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_location : Pointer(Void), lib_mark : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextBuffer.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          location = Gtk::TextIter.new(lib_location, :none)
          # Generator::GObjectArgPlan
          mark = Gtk::TextMark.new(lib_mark, :none)
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextIter, Gtk::TextMark, Nil)).unbox(_lib_box).call(_sender, location, mark)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(location : Gtk::TextIter, mark : Gtk::TextMark) : Nil
        LibGObject.g_signal_emit_by_name(@source, "mark-set", location, mark)
      end
    end

    def mark_set_signal
      MarkSetSignal.new(self)
    end

    # Emitted when the modified bit of a `GtkTextBuffer` flips.
    #
    # See also: `Gtk::TextBuffer#modified=`.
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

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TextBuffer, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextBuffer.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextBuffer, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextBuffer.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "modified-changed")
      end
    end

    def modified_changed_signal
      ModifiedChangedSignal.new(self)
    end

    # Emitted after paste operation has been completed.
    #
    # This is useful to properly scroll the view to the end
    # of the pasted text. See `Gtk::TextBuffer#paste_clipboard`
    # for more details.
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

      def connect(handler : Proc(Gdk::Clipboard, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_clipboard : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          clipboard = Gdk::Clipboard.new(lib_clipboard, :none)
          ::Box(Proc(Gdk::Clipboard, Nil)).unbox(_lib_box).call(clipboard)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gdk::Clipboard, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_clipboard : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          clipboard = Gdk::Clipboard.new(lib_clipboard, :none)
          ::Box(Proc(Gdk::Clipboard, Nil)).unbox(_lib_box).call(clipboard)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TextBuffer, Gdk::Clipboard, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_clipboard : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextBuffer.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          clipboard = Gdk::Clipboard.new(lib_clipboard, :none)
          ::Box(Proc(Gtk::TextBuffer, Gdk::Clipboard, Nil)).unbox(_lib_box).call(_sender, clipboard)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextBuffer, Gdk::Clipboard, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_clipboard : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextBuffer.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          clipboard = Gdk::Clipboard.new(lib_clipboard, :none)
          ::Box(Proc(Gtk::TextBuffer, Gdk::Clipboard, Nil)).unbox(_lib_box).call(_sender, clipboard)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(clipboard : Gdk::Clipboard) : Nil
        LibGObject.g_signal_emit_by_name(@source, "paste-done", clipboard)
      end
    end

    def paste_done_signal
      PasteDoneSignal.new(self)
    end

    # Emitted when a request has been made to redo the
    # previously undone operation.
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

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TextBuffer, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextBuffer.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextBuffer, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextBuffer.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "redo")
      end
    end

    def redo_signal
      RedoSignal.new(self)
    end

    # Emitted to remove all occurrences of @tag from a range
    # of text in a `GtkTextBuffer`.
    #
    # Removal actually occurs in the default handler.
    #
    # Note that if your handler runs before the default handler
    # it must not invalidate the @start and @end iters (or has
    # to revalidate them).
    #
    # See also: `Gtk::TextBuffer#remove_tag`.
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

      def connect(handler : Proc(Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_tag : Pointer(Void), lib_start : Pointer(Void), lib__end : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          tag = Gtk::TextTag.new(lib_tag, :none)
          # Generator::GObjectArgPlan
          start = Gtk::TextIter.new(lib_start, :none)
          # Generator::GObjectArgPlan
          _end = Gtk::TextIter.new(lib__end, :none)
          ::Box(Proc(Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil)).unbox(_lib_box).call(tag, start, _end)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_tag : Pointer(Void), lib_start : Pointer(Void), lib__end : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::GObjectArgPlan
          tag = Gtk::TextTag.new(lib_tag, :none)
          # Generator::GObjectArgPlan
          start = Gtk::TextIter.new(lib_start, :none)
          # Generator::GObjectArgPlan
          _end = Gtk::TextIter.new(lib__end, :none)
          ::Box(Proc(Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil)).unbox(_lib_box).call(tag, start, _end)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TextBuffer, Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_tag : Pointer(Void), lib_start : Pointer(Void), lib__end : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextBuffer.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          tag = Gtk::TextTag.new(lib_tag, :none)
          # Generator::GObjectArgPlan
          start = Gtk::TextIter.new(lib_start, :none)
          # Generator::GObjectArgPlan
          _end = Gtk::TextIter.new(lib__end, :none)
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil)).unbox(_lib_box).call(_sender, tag, start, _end)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextBuffer, Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_tag : Pointer(Void), lib_start : Pointer(Void), lib__end : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextBuffer.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::GObjectArgPlan
          tag = Gtk::TextTag.new(lib_tag, :none)
          # Generator::GObjectArgPlan
          start = Gtk::TextIter.new(lib_start, :none)
          # Generator::GObjectArgPlan
          _end = Gtk::TextIter.new(lib__end, :none)
          ::Box(Proc(Gtk::TextBuffer, Gtk::TextTag, Gtk::TextIter, Gtk::TextIter, Nil)).unbox(_lib_box).call(_sender, tag, start, _end)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(tag : Gtk::TextTag, start : Gtk::TextIter, _end : Gtk::TextIter) : Nil
        LibGObject.g_signal_emit_by_name(@source, "remove-tag", tag, start, _end)
      end
    end

    def remove_tag_signal
      RemoveTagSignal.new(self)
    end

    # Emitted when a request has been made to undo the
    # previous operation or set of operations that have
    # been grouped together.
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

      def connect(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          ::Box(Proc(Nil)).unbox(_lib_box).call
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::TextBuffer, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextBuffer.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::TextBuffer, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::TextBuffer.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::TextBuffer, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
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
