require "./widget"
require "./accessible"

require "./buildable"

require "./constraint_target"

require "./font_chooser"

module Gtk
  # The `GtkFontButton` allows to open a font chooser dialog to change
  # the font.
  #
  # ![An example GtkFontButton](font-button.png)
  #
  # It is suitable widget for selecting a font in a preference dialog.
  #
  # # CSS nodes
  #
  # ```
  # fontbutton
  # ╰── button.font
  # ╰── [content]
  # ```
  #
  # `GtkFontButton` has a single CSS node with name fontbutton which
  # contains a button node with the .font style class.
  @[GObject::GeneratedWrapper]
  class FontButton < Widget
    include Accessible
    include Buildable
    include ConstraintTarget
    include FontChooser

    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGtk::FontButton), instance_init, 0)
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

    def initialize(*, accessible_role : Gtk::AccessibleRole? = nil, can_focus : Bool? = nil, can_target : Bool? = nil, css_classes : Enumerable(::String)? = nil, css_name : ::String? = nil, cursor : Gdk::Cursor? = nil, focus_on_click : Bool? = nil, focusable : Bool? = nil, font : ::String? = nil, font_desc : Pango::FontDescription? = nil, font_features : ::String? = nil, halign : Gtk::Align? = nil, has_default : Bool? = nil, has_focus : Bool? = nil, has_tooltip : Bool? = nil, height_request : Int32? = nil, hexpand : Bool? = nil, hexpand_set : Bool? = nil, language : ::String? = nil, layout_manager : Gtk::LayoutManager? = nil, level : Gtk::FontChooserLevel? = nil, margin_bottom : Int32? = nil, margin_end : Int32? = nil, margin_start : Int32? = nil, margin_top : Int32? = nil, modal : Bool? = nil, name : ::String? = nil, opacity : Float64? = nil, overflow : Gtk::Overflow? = nil, parent : Gtk::Widget? = nil, preview_text : ::String? = nil, receives_default : Bool? = nil, root : Gtk::Root? = nil, scale_factor : Int32? = nil, sensitive : Bool? = nil, show_preview_entry : Bool? = nil, title : ::String? = nil, tooltip_markup : ::String? = nil, tooltip_text : ::String? = nil, use_font : Bool? = nil, use_size : Bool? = nil, valign : Gtk::Align? = nil, vexpand : Bool? = nil, vexpand_set : Bool? = nil, visible : Bool? = nil, width_request : Int32? = nil)
      _names = uninitialized Pointer(LibC::Char)[46]
      _values = StaticArray(LibGObject::Value, 46).new(LibGObject::Value.new)
      _n = 0

      if !accessible_role.nil?
        (_names.to_unsafe + _n).value = "accessible-role".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, accessible_role)
        _n += 1
      end
      if !can_focus.nil?
        (_names.to_unsafe + _n).value = "can-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_focus)
        _n += 1
      end
      if !can_target.nil?
        (_names.to_unsafe + _n).value = "can-target".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, can_target)
        _n += 1
      end
      if !css_classes.nil?
        (_names.to_unsafe + _n).value = "css-classes".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, css_classes)
        _n += 1
      end
      if !css_name.nil?
        (_names.to_unsafe + _n).value = "css-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, css_name)
        _n += 1
      end
      if !cursor.nil?
        (_names.to_unsafe + _n).value = "cursor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, cursor)
        _n += 1
      end
      if !focus_on_click.nil?
        (_names.to_unsafe + _n).value = "focus-on-click".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focus_on_click)
        _n += 1
      end
      if !focusable.nil?
        (_names.to_unsafe + _n).value = "focusable".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, focusable)
        _n += 1
      end
      if !font.nil?
        (_names.to_unsafe + _n).value = "font".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, font)
        _n += 1
      end
      if !font_desc.nil?
        (_names.to_unsafe + _n).value = "font-desc".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, font_desc)
        _n += 1
      end
      if !font_features.nil?
        (_names.to_unsafe + _n).value = "font-features".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, font_features)
        _n += 1
      end
      if !halign.nil?
        (_names.to_unsafe + _n).value = "halign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, halign)
        _n += 1
      end
      if !has_default.nil?
        (_names.to_unsafe + _n).value = "has-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_default)
        _n += 1
      end
      if !has_focus.nil?
        (_names.to_unsafe + _n).value = "has-focus".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_focus)
        _n += 1
      end
      if !has_tooltip.nil?
        (_names.to_unsafe + _n).value = "has-tooltip".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, has_tooltip)
        _n += 1
      end
      if !height_request.nil?
        (_names.to_unsafe + _n).value = "height-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, height_request)
        _n += 1
      end
      if !hexpand.nil?
        (_names.to_unsafe + _n).value = "hexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hexpand)
        _n += 1
      end
      if !hexpand_set.nil?
        (_names.to_unsafe + _n).value = "hexpand-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, hexpand_set)
        _n += 1
      end
      if !language.nil?
        (_names.to_unsafe + _n).value = "language".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, language)
        _n += 1
      end
      if !layout_manager.nil?
        (_names.to_unsafe + _n).value = "layout-manager".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, layout_manager)
        _n += 1
      end
      if !level.nil?
        (_names.to_unsafe + _n).value = "level".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, level)
        _n += 1
      end
      if !margin_bottom.nil?
        (_names.to_unsafe + _n).value = "margin-bottom".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_bottom)
        _n += 1
      end
      if !margin_end.nil?
        (_names.to_unsafe + _n).value = "margin-end".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_end)
        _n += 1
      end
      if !margin_start.nil?
        (_names.to_unsafe + _n).value = "margin-start".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_start)
        _n += 1
      end
      if !margin_top.nil?
        (_names.to_unsafe + _n).value = "margin-top".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, margin_top)
        _n += 1
      end
      if !modal.nil?
        (_names.to_unsafe + _n).value = "modal".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, modal)
        _n += 1
      end
      if !name.nil?
        (_names.to_unsafe + _n).value = "name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, name)
        _n += 1
      end
      if !opacity.nil?
        (_names.to_unsafe + _n).value = "opacity".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, opacity)
        _n += 1
      end
      if !overflow.nil?
        (_names.to_unsafe + _n).value = "overflow".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, overflow)
        _n += 1
      end
      if !parent.nil?
        (_names.to_unsafe + _n).value = "parent".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, parent)
        _n += 1
      end
      if !preview_text.nil?
        (_names.to_unsafe + _n).value = "preview-text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, preview_text)
        _n += 1
      end
      if !receives_default.nil?
        (_names.to_unsafe + _n).value = "receives-default".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, receives_default)
        _n += 1
      end
      if !root.nil?
        (_names.to_unsafe + _n).value = "root".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, root)
        _n += 1
      end
      if !scale_factor.nil?
        (_names.to_unsafe + _n).value = "scale-factor".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, scale_factor)
        _n += 1
      end
      if !sensitive.nil?
        (_names.to_unsafe + _n).value = "sensitive".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, sensitive)
        _n += 1
      end
      if !show_preview_entry.nil?
        (_names.to_unsafe + _n).value = "show-preview-entry".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, show_preview_entry)
        _n += 1
      end
      if !title.nil?
        (_names.to_unsafe + _n).value = "title".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title)
        _n += 1
      end
      if !tooltip_markup.nil?
        (_names.to_unsafe + _n).value = "tooltip-markup".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_markup)
        _n += 1
      end
      if !tooltip_text.nil?
        (_names.to_unsafe + _n).value = "tooltip-text".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, tooltip_text)
        _n += 1
      end
      if !use_font.nil?
        (_names.to_unsafe + _n).value = "use-font".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, use_font)
        _n += 1
      end
      if !use_size.nil?
        (_names.to_unsafe + _n).value = "use-size".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, use_size)
        _n += 1
      end
      if !valign.nil?
        (_names.to_unsafe + _n).value = "valign".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, valign)
        _n += 1
      end
      if !vexpand.nil?
        (_names.to_unsafe + _n).value = "vexpand".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vexpand)
        _n += 1
      end
      if !vexpand_set.nil?
        (_names.to_unsafe + _n).value = "vexpand-set".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, vexpand_set)
        _n += 1
      end
      if !visible.nil?
        (_names.to_unsafe + _n).value = "visible".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, visible)
        _n += 1
      end
      if !width_request.nil?
        (_names.to_unsafe + _n).value = "width-request".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, width_request)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(FontButton.g_type, _n, _names, _values)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_font_button_get_type
    end

    def modal=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "modal", unsafe_value, Pointer(Void).null)
      value
    end

    def modal? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "modal", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def title=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "title", unsafe_value, Pointer(Void).null)
      value
    end

    def title : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "title", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def use_font=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "use-font", unsafe_value, Pointer(Void).null)
      value
    end

    def use_font? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "use-font", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    def use_size=(value : Bool) : Bool
      unsafe_value = value

      LibGObject.g_object_set(self, "use-size", unsafe_value, Pointer(Void).null)
      value
    end

    def use_size? : Bool
      # Returns: None

      value = uninitialized LibC::Int
      LibGObject.g_object_get(self, "use-size", pointerof(value), Pointer(Void).null)
      GICrystal.to_bool(value)
    end

    # Creates a new font picker widget.
    def initialize
      # gtk_font_button_new: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_font_button_new

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Creates a new font picker widget showing the given font.
    def self.new_with_font(fontname : ::String) : self
      # gtk_font_button_new_with_font: (Constructor)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_font_button_new_with_font(fontname)

      # Return value handling
      LibGObject.g_object_ref_sink(_retval)

      Gtk::FontButton.new(_retval, GICrystal::Transfer::Full)
    end

    # Gets whether the dialog is modal.
    def modal : Bool
      # gtk_font_button_get_modal: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_font_button_get_modal(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Retrieves the title of the font chooser dialog.
    def title : ::String
      # gtk_font_button_get_title: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_font_button_get_title(self)

      # Return value handling

      ::String.new(_retval)
    end

    # Returns whether the selected font is used in the label.
    def use_font : Bool
      # gtk_font_button_get_use_font: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_font_button_get_use_font(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Returns whether the selected size is used in the label.
    def use_size : Bool
      # gtk_font_button_get_use_size: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_font_button_get_use_size(self)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Sets whether the dialog should be modal.
    def modal=(modal : Bool) : Nil
      # gtk_font_button_set_modal: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_font_button_set_modal(self, modal)

      # Return value handling
    end

    # Sets the title for the font chooser dialog.
    def title=(title : ::String) : Nil
      # gtk_font_button_set_title: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_font_button_set_title(self, title)

      # Return value handling
    end

    # If @use_font is %TRUE, the font name will be written
    # using the selected font.
    def use_font=(use_font : Bool) : Nil
      # gtk_font_button_set_use_font: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_font_button_set_use_font(self, use_font)

      # Return value handling
    end

    # If @use_size is %TRUE, the font name will be written using
    # the selected size.
    def use_size=(use_size : Bool) : Nil
      # gtk_font_button_set_use_size: (Method | Setter)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_font_button_set_use_size(self, use_size)

      # Return value handling
    end

    # Emitted to when the font button is activated.
    #
    # The `::activate` signal on `GtkFontButton` is an action signal and
    # emitting it causes the button to present its dialog.
    struct ActivateSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "activate::#{@detail}" : "activate"
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

      def connect(handler : Proc(Gtk::FontButton, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::FontButton.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FontButton, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::FontButton, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::FontButton.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FontButton, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "activate")
      end
    end

    def activate_signal
      ActivateSignal.new(self)
    end

    # Emitted when the user selects a font.
    #
    # When handling this signal, use `Gtk::FontChooser#font`
    # to find out which font was just selected.
    #
    # Note that this signal is only emitted when the user changes the font.
    # If you need to react to programmatic font changes as well, use
    # the notify::font signal.
    struct FontSetSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "font-set::#{@detail}" : "font-set"
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

      def connect(handler : Proc(Gtk::FontButton, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::FontButton.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FontButton, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::FontButton, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::FontButton.new(_lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::FontButton, Nil)).unbox(_lib_box).call(_sender)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "font-set")
      end
    end

    def font_set_signal
      FontSetSignal.new(self)
    end
  end
end
