require "../g_object-2.0/object"

module Gtk
  # A `GtkTextMark` is a position in a `GtkTextbuffer` that is preserved
  # across modifications.
  #
  # You may wish to begin by reading the
  # [text widget conceptual overview](section-text-widget.html),
  # which gives an overview of all the objects and data types
  # related to the text widget and how they work together.
  #
  # A `GtkTextMark` is like a bookmark in a text buffer; it preserves
  # a position in the text. You can convert the mark to an iterator using
  # `Gtk::TextBuffer#iter_at_mark`. Unlike iterators, marks remain
  # valid across buffer mutations, because their behavior is defined when
  # text is inserted or deleted. When text containing a mark is deleted,
  # the mark remains in the position originally occupied by the deleted
  # text. When text is inserted at a mark, a mark with “left gravity” will
  # be moved to the beginning of the newly-inserted text, and a mark with
  # “right gravity” will be moved to the end.
  #
  # Note that “left” and “right” here refer to logical direction (left
  # is the toward the start of the buffer); in some languages such as
  # Hebrew the logically-leftmost text is not actually on the left when
  # displayed.
  #
  # Marks are reference counted, but the reference count only controls
  # the validity of the memory; marks can be deleted from the buffer at
  # any time with `Gtk::TextBuffer#delete_mark`. Once deleted from
  # the buffer, a mark is essentially useless.
  #
  # Marks optionally have names; these can be convenient to avoid passing
  # the `GtkTextMark` object around.
  #
  # Marks are typically created using the `Gtk::TextBuffer#create_mark`
  # function.
  @[GObject::GeneratedWrapper]
  class TextMark < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::TextMarkClass), class_init,
        sizeof(LibGtk::TextMark), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, left_gravity : Bool? = nil, name : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[2]
      _values = StaticArray(LibGObject::Value, 2).new(LibGObject::Value.new)
      _n = 0

      if !left_gravity.nil?
        (_names.to_unsafe + _n).value = "left-gravity".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, left_gravity)
        _n += 1
      end
      if !name.nil?
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(TextMark.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_text_mark_get_type
    end

    def left_gravity=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "left-gravity", unsafe_value, Pointer(Void).null)
      value
    end

    def left_gravity? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "left-gravity", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "name", unsafe_value, Pointer(Void).null)
      value
    end

    def name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    # Creates a text mark.
    #
    # Add it to a buffer using `Gtk::TextBuffer#add_mark`.
    # If @name is %NULL, the mark is anonymous; otherwise, the mark can be
    # retrieved by name using `Gtk::TextBuffer#mark`. If a mark
    # has left gravity, and text is inserted at the mark’s current location,
    # the mark will be moved to the left of the newly-inserted text. If the
    # mark has right gravity (@left_gravity = %FALSE), the mark will end up
    # on the right of newly-inserted text. The standard left-to-right cursor
    # is a mark with right gravity (when you type, the cursor stays on the
    # right side of the text you’re typing).
    def initialize(name : ::String?, left_gravity : Bool)
      # gtk_text_mark_new: (Constructor)
      # @name: (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      name = if name.nil?
               Pointer(LibC::Char).null
             else
               name.to_unsafe
             end

      # C call
      _retval = LibGtk.gtk_text_mark_new(name, left_gravity)

      # Return value handling

      @pointer = _retval
    end

    # Gets the buffer this mark is located inside.
    #
    # Returns %NULL if the mark is deleted.
    def buffer : Gtk::TextBuffer?
      # gtk_text_mark_get_buffer: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_mark_get_buffer(self)

      # Return value handling

      Gtk::TextBuffer.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Returns %TRUE if the mark has been removed from its buffer.
    #
    # See `Gtk::TextBuffer#add_mark` for a way to add it
    # to a buffer again.
    def deleted : Bool
      # gtk_text_mark_get_deleted: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_mark_get_deleted(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Determines whether the mark has left gravity.
    def left_gravity : Bool
      # gtk_text_mark_get_left_gravity: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_mark_get_left_gravity(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns the mark name.
    #
    # Returns %NULL for anonymous marks.
    def name : ::String?
      # gtk_text_mark_get_name: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_mark_get_name(self)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Returns %TRUE if the mark is visible.
    #
    # A cursor is displayed for visible marks.
    def visible : Bool
      # gtk_text_mark_get_visible: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_text_mark_get_visible(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def visible=(setting : Bool) : Nil
      # gtk_text_mark_set_visible: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_text_mark_set_visible(self, setting)

      # Return value handling
    end
  end
end
