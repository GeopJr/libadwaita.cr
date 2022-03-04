module Gtk
  # `GtkFontChooser` is an interface that can be implemented by widgets
  # for choosing fonts.
  #
  # In GTK, the main objects that implement this interface are
  # [class@Gtk.FontChooserWidget], [class@Gtk.FontChooserDialog] and
  # [class@Gtk.FontButton].
  module FontChooser
    def font=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "font", unsafe_value, Pointer(Void).null)
      value
    end

    def font : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "font", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def font_desc=(value : Pango::FontDescription?) : Pango::FontDescription?
      unsafe_value = value

      LibGObject.g_object_set(self, "font-desc", unsafe_value, Pointer(Void).null)
      value
    end

    def font_desc : Pango::FontDescription?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "font-desc", pointerof(value), Pointer(Void).null)
      Pango::FontDescription.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def font_features : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "font-features", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def language=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "language", unsafe_value, Pointer(Void).null)
      value
    end

    def language : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "language", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def level=(value : Gtk::FontChooserLevel) : Gtk::FontChooserLevel
      unsafe_value = value

      LibGObject.g_object_set(self, "level", unsafe_value, Pointer(Void).null)
      value
    end

    def level : Gtk::FontChooserLevel
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "level", pointerof(value), Pointer(Void).null)
      Gtk::FontChooserLevel.from_value(value)
    end

    def preview_text=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "preview-text", unsafe_value, Pointer(Void).null)
      value
    end

    def preview_text : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "preview-text", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def show_preview_entry=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "show-preview-entry", unsafe_value, Pointer(Void).null)
      value
    end

    def show_preview_entry? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "show-preview-entry", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def font : ::String?
      # gtk_font_chooser_get_font: (Method | Getter)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_font_chooser_get_font(self)

      # Return value handling
      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def font_desc : Pango::FontDescription?
      # gtk_font_chooser_get_font_desc: (Method | Getter)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_font_chooser_get_font_desc(self)

      # Return value handling
      Pango::FontDescription.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def font_face : Pango::FontFace?
      # gtk_font_chooser_get_font_face: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_font_chooser_get_font_face(self)

      # Return value handling
      Pango::FontFace.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def font_family : Pango::FontFamily?
      # gtk_font_chooser_get_font_family: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_font_chooser_get_font_family(self)

      # Return value handling
      Pango::FontFamily.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def font_features : ::String
      # gtk_font_chooser_get_font_features: (Method | Getter)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_font_chooser_get_font_features(self)

      # Return value handling
      GICrystal.transfer_full(_retval)
    end

    def font_map : Pango::FontMap?
      # gtk_font_chooser_get_font_map: (Method)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_font_chooser_get_font_map(self)

      # Return value handling
      Pango::FontMap.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def font_size : Int32
      # gtk_font_chooser_get_font_size: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_font_chooser_get_font_size(self)

      # Return value handling
      _retval
    end

    def language : ::String
      # gtk_font_chooser_get_language: (Method | Getter)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_font_chooser_get_language(self)

      # Return value handling
      GICrystal.transfer_full(_retval)
    end

    def level : Gtk::FontChooserLevel
      # gtk_font_chooser_get_level: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_font_chooser_get_level(self)

      # Return value handling
      Gtk::FontChooserLevel.from_value(_retval)
    end

    def preview_text : ::String
      # gtk_font_chooser_get_preview_text: (Method | Getter)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_font_chooser_get_preview_text(self)

      # Return value handling
      GICrystal.transfer_full(_retval)
    end

    def show_preview_entry : Bool
      # gtk_font_chooser_get_show_preview_entry: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibGtk.gtk_font_chooser_get_show_preview_entry(self)

      # Return value handling
      GICrystal.to_bool(_retval)
    end

    def set_filter_func(filter : Pointer(Void)?, user_data : Pointer(Void)?, destroy : Pointer(Void)) : Nil
      # gtk_font_chooser_set_filter_func: (Method)
      # @filter: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      filter = if filter.nil?
                 LibGtk::FontFilterFunc.null
               else
                 filter.to_unsafe
               end
      user_data = if user_data.nil?
                    Pointer(Void).null
                  else
                    user_data.to_unsafe
                  end

      # C call
      LibGtk.gtk_font_chooser_set_filter_func(self, filter, user_data, destroy)

      # Return value handling
    end

    def font=(fontname : ::String) : Nil
      # gtk_font_chooser_set_font: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_font_chooser_set_font(self, fontname)

      # Return value handling
    end

    def font_desc=(font_desc : Pango::FontDescription) : Nil
      # gtk_font_chooser_set_font_desc: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_font_chooser_set_font_desc(self, font_desc)

      # Return value handling
    end

    def font_map=(fontmap : Pango::FontMap?) : Nil
      # gtk_font_chooser_set_font_map: (Method)
      # @fontmap: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      fontmap = if fontmap.nil?
                  Pointer(Void).null
                else
                  fontmap.to_unsafe
                end

      # C call
      LibGtk.gtk_font_chooser_set_font_map(self, fontmap)

      # Return value handling
    end

    def language=(language : ::String) : Nil
      # gtk_font_chooser_set_language: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_font_chooser_set_language(self, language)

      # Return value handling
    end

    def level=(level : Gtk::FontChooserLevel) : Nil
      # gtk_font_chooser_set_level: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_font_chooser_set_level(self, level)

      # Return value handling
    end

    def preview_text=(text : ::String) : Nil
      # gtk_font_chooser_set_preview_text: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_font_chooser_set_preview_text(self, text)

      # Return value handling
    end

    def show_preview_entry=(show_preview_entry : Bool) : Nil
      # gtk_font_chooser_set_show_preview_entry: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibGtk.gtk_font_chooser_set_show_preview_entry(self, show_preview_entry)

      # Return value handling
    end

    abstract def to_unsafe
  end

  # :nodoc:
  class FontChooser__Impl < GObject::Object
    include FontChooser

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_font_chooser_get_type
    end

    # Cast a `GObject::Object` to `FontChooser`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to FontChooser")
    end

    # Cast a `GObject::Object` to `FontChooser`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end
  end
end
