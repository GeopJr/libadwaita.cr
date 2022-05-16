module Gtk
  # `GtkFontChooser` is an interface that can be implemented by widgets
  # for choosing fonts.
  #
  # In GTK, the main objects that implement this interface are
  # `Gtk#FontChooserWidget`, `Gtk#FontChooserDialog` and
  # `Gtk#FontButton`.
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
      Gtk::FontChooserLevel.new(value)
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

      # C call
      _retval = LibGtk.gtk_font_chooser_get_font(@pointer)

      # Return value handling

      GICrystal.transfer_full(_retval) unless _retval.null?
    end

    def font_desc : Pango::FontDescription?
      # gtk_font_chooser_get_font_desc: (Method | Getter)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_font_chooser_get_font_desc(@pointer)

      # Return value handling

      Pango::FontDescription.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def font_face : Pango::FontFace?
      # gtk_font_chooser_get_font_face: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_font_chooser_get_font_face(@pointer)

      # Return value handling

      Pango::FontFace.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def font_family : Pango::FontFamily?
      # gtk_font_chooser_get_font_family: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_font_chooser_get_font_family(@pointer)

      # Return value handling

      Pango::FontFamily.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def font_features : ::String
      # gtk_font_chooser_get_font_features: (Method | Getter)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_font_chooser_get_font_features(@pointer)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    def font_map : Pango::FontMap?
      # gtk_font_chooser_get_font_map: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_font_chooser_get_font_map(@pointer)

      # Return value handling

      Pango::FontMap.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    def font_size : Int32
      # gtk_font_chooser_get_font_size: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_font_chooser_get_font_size(@pointer)

      # Return value handling

      _retval
    end

    def language : ::String
      # gtk_font_chooser_get_language: (Method | Getter)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_font_chooser_get_language(@pointer)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    def level : Gtk::FontChooserLevel
      # gtk_font_chooser_get_level: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_font_chooser_get_level(@pointer)

      # Return value handling

      Gtk::FontChooserLevel.new(_retval)
    end

    def preview_text : ::String
      # gtk_font_chooser_get_preview_text: (Method | Getter)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_font_chooser_get_preview_text(@pointer)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end

    def show_preview_entry : Bool
      # gtk_font_chooser_get_show_preview_entry: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_font_chooser_get_show_preview_entry(@pointer)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    def filter_func=(filter : Gtk::FontFilterFunc?) : Nil
      # gtk_font_chooser_set_filter_func: (Method)
      # @filter: (nullable)
      # @user_data: (nullable)
      # Returns: (transfer none)

      # Generator::CallbackArgPlan
      if filter
        _box = ::Box.box(filter)
        filter = ->(lib_family : Pointer(Void), lib_face : Pointer(Void), lib_data : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          family = Pango::FontFamily.new(lib_family, :none)
          # Generator::BuiltInTypeArgPlan
          face = Pango::FontFace.new(lib_face, :none)
          ::Box(Proc(Pango::FontFamily, Pango::FontFace, Bool)).unbox(lib_data).call(family, face)
        }.pointer
        user_data = GICrystal::ClosureDataManager.register(_box)
        destroy = ->GICrystal::ClosureDataManager.deregister(Pointer(Void)).pointer
      else
        filter = user_data = destroy = Pointer(Void).null
      end

      # C call
      LibGtk.gtk_font_chooser_set_filter_func(@pointer, filter, user_data, destroy)

      # Return value handling
    end

    def font=(fontname : ::String) : Nil
      # gtk_font_chooser_set_font: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_font_chooser_set_font(@pointer, fontname)

      # Return value handling
    end

    def font_desc=(font_desc : Pango::FontDescription) : Nil
      # gtk_font_chooser_set_font_desc: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_font_chooser_set_font_desc(@pointer, font_desc)

      # Return value handling
    end

    def font_map=(fontmap : Pango::FontMap?) : Nil
      # gtk_font_chooser_set_font_map: (Method)
      # @fontmap: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      fontmap = if fontmap.nil?
                  Pointer(Void).null
                else
                  fontmap.to_unsafe
                end

      # C call
      LibGtk.gtk_font_chooser_set_font_map(@pointer, fontmap)

      # Return value handling
    end

    def language=(language : ::String) : Nil
      # gtk_font_chooser_set_language: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_font_chooser_set_language(@pointer, language)

      # Return value handling
    end

    def level=(level : Gtk::FontChooserLevel) : Nil
      # gtk_font_chooser_set_level: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_font_chooser_set_level(@pointer, level)

      # Return value handling
    end

    def preview_text=(text : ::String) : Nil
      # gtk_font_chooser_set_preview_text: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_font_chooser_set_preview_text(@pointer, text)

      # Return value handling
    end

    def show_preview_entry=(show_preview_entry : Bool) : Nil
      # gtk_font_chooser_set_show_preview_entry: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_font_chooser_set_show_preview_entry(@pointer, show_preview_entry)

      # Return value handling
    end

    struct FontActivatedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "font-activated::#{@detail}" : "font-activated"
      end

      def connect(&block : Proc(::String, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(::String, Nil))
        connect(block)
      end

      def connect(handler : Proc(::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_fontname : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          fontname = ::String.new(lib_fontname)
          ::Box(Proc(::String, Nil)).unbox(_lib_box).call(fontname)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_fontname : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          fontname = ::String.new(lib_fontname)
          ::Box(Proc(::String, Nil)).unbox(_lib_box).call(fontname)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::FontChooser, ::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_fontname : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          _sender = Gtk::AbstractFontChooser.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          fontname = ::String.new(lib_fontname)
          ::Box(Proc(Gtk::FontChooser, ::String, Nil)).unbox(_lib_box).call(_sender, fontname)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::FontChooser, ::String, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_fontname : Pointer(LibC::Char), _lib_box : Pointer(Void)) {
          _sender = Gtk::AbstractFontChooser.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          fontname = ::String.new(lib_fontname)
          ::Box(Proc(Gtk::FontChooser, ::String, Nil)).unbox(_lib_box).call(_sender, fontname)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(fontname : ::String) : Nil
        LibGObject.g_signal_emit_by_name(@source, "font-activated", fontname)
      end
    end

    def font_activated_signal
      FontActivatedSignal.new(self)
    end

    abstract def to_unsafe
  end

  # :nodoc:
  @[GObject::GeneratedWrapper]
  class AbstractFontChooser < GObject::Object
    include FontChooser

    GICrystal.define_new_method(Gtk::AbstractFontChooser, g_object_get_qdata, g_object_set_qdata)

    # Forbid users to create instances of this.
    private def initialize
    end

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
