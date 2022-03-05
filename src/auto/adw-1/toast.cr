require "../g_object-2.0/object"

module Adw
  # A helper object for [class@ToastOverlay].
  #
  # Toasts are meant to be passed into [method@ToastOverlay.add_toast] as
  # follows:
  #
  # ```c
  # adw_toast_overlay_add_toast (overlay, adw_toast_new (_("Simple Toast"));
  # ```
  #
  # <picture>
  #   <source srcset="toast-simple-dark.png" media="(prefers-color-scheme: dark)">
  #   <img src="toast-simple.png" alt="toast-simple">
  # </picture>
  #
  # Toasts always have a close button. They emit the [signal@Toast::dismissed]
  # signal when disappearing.
  #
  # [property@Toast:timeout] determines how long the toast stays on screen, while
  # [property@Toast:priority] determines how it behaves if another toast is
  # already being displayed.
  #
  # ## Actions
  #
  # Toasts can have one button on them, with a label and an attached
  # [iface@Gio.Action].
  #
  # ```c
  # AdwToast *toast = adw_toast_new (_("Toast with Action"));
  #
  # adw_toast_set_button_label (toast, _("_Example"));
  # adw_toast_set_action_name (toast, "win.example");
  #
  # adw_toast_overlay_add_toast (overlay, toast);
  # ```
  #
  # <picture>
  #   <source srcset="toast-action-dark.png" media="(prefers-color-scheme: dark)">
  #   <img src="toast-action.png" alt="toast-action">
  # </picture>
  #
  # ## Modifying toasts
  #
  # Toasts can be modified after they have been shown. For this, an `AdwToast`
  # reference must be kept around while the toast is visible.
  #
  # A common use case for this is using toasts as undo prompts that stack with
  # each other, allowing to batch undo the last deleted items:
  #
  # ```c
  #
  # static void
  # toast_undo_cb (GtkWidget  *sender,
  #                const char *action,
  #                GVariant   *param)
  # {
  #   // Undo the deletion
  # }
  #
  # static void
  # dismissed_cb (MyWindow *self)
  # {
  #   self->undo_toast = NULL;
  #
  #   // Permanently delete the items
  # }
  #
  # static void
  # delete_item (MyWindow *self,
  #              MyItem   *item)
  # {
  #   g_autofree char *title = NULL;
  #   int n_items;
  #
  #   // Mark the item as waiting for deletion
  #   n_items = ... // The number of waiting items
  #
  #   if (!self->undo_toast) {
  #     title = g_strdup_printf (_("‘%s’ deleted"), ...);
  #
  #     self->undo_toast = adw_toast_new (title);
  #
  #     adw_toast_set_priority (self->undo_toast, ADW_TOAST_PRIORITY_HIGH);
  #     adw_toast_set_button_label (self->undo_toast, _("_Undo"));
  #     adw_toast_set_action_name (self->undo_toast, "toast.undo");
  #
  #     g_signal_connect_swapped (self->undo_toast, "dismissed",
  #                               G_CALLBACK (dismissed_cb), self);
  #
  #     adw_toast_overlay_add_toast (self->toast_overlay, self->undo_toast);
  #
  #     return;
  #   }
  #
  #   title =
  #     g_strdup_printf (ngettext ("<span font_features='tnum=1'>%d</span> item deleted",
  #                                "<span font_features='tnum=1'>%d</span> items deleted",
  #                                n_items), n_items);
  #
  #   adw_toast_set_title (self->undo_toast, title);
  # }
  #
  # static void
  # my_window_class_init (MyWindowClass *klass)
  # {
  #   GtkWidgetClass *widget_class = GTK_WIDGET_CLASS (klass);
  #
  #   gtk_widget_class_install_action (widget_class, "toast.undo", NULL, toast_undo_cb);
  # }
  # ```
  #
  # <picture>
  #   <source srcset="toast-undo-dark.png" media="(prefers-color-scheme: dark)">
  #   <img src="toast-undo.png" alt="toast-undo">
  # </picture>
  class Toast < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, action_name : ::String? = nil, action_target : GLib::Variant? = nil, button_label : ::String? = nil, priority : Adw::ToastPriority? = nil, timeout : UInt32? = nil, title : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[6]
      _values = StaticArray(LibGObject::Value, 6).new(LibGObject::Value.new)
      _n = 0

      if action_name
        (_names.to_unsafe + _n).value = "action-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, action_name)
        _n += 1
      end
      if action_target
        (_names.to_unsafe + _n).value = "action-target".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, action_target)
        _n += 1
      end
      if button_label
        (_names.to_unsafe + _n).value = "button-label".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, button_label)
        _n += 1
      end
      if priority
        (_names.to_unsafe + _n).value = "priority".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, priority)
        _n += 1
      end
      if timeout
        (_names.to_unsafe + _n).value = "timeout".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, timeout)
        _n += 1
      end
      if title
        (_names.to_unsafe + _n).value = "title".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, title)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Toast.g_type, _n, _names, _values)
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibAdw.adw_toast_get_type
    end

    def action_name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "action-name", unsafe_value, Pointer(Void).null)
      value
    end

    def action_name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "action-name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def action_target=(value : GLib::Variant?) : GLib::Variant?
      unsafe_value = value

      LibGObject.g_object_set(self, "action-target", unsafe_value, Pointer(Void).null)
      value
    end

    def action_target : GLib::Variant?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "action-target", pointerof(value), Pointer(Void).null)
      GLib::Variant.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def button_label=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "button-label", unsafe_value, Pointer(Void).null)
      value
    end

    def button_label : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "button-label", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    def priority=(value : Adw::ToastPriority) : Adw::ToastPriority
      unsafe_value = value

      LibGObject.g_object_set(self, "priority", unsafe_value, Pointer(Void).null)
      value
    end

    def priority : Adw::ToastPriority
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "priority", pointerof(value), Pointer(Void).null)
      Adw::ToastPriority.from_value(value)
    end

    def timeout=(value : UInt32) : UInt32
      unsafe_value = value

      LibGObject.g_object_set(self, "timeout", unsafe_value, Pointer(Void).null)
      value
    end

    def timeout : UInt32
      # Returns: None

      value = uninitialized UInt32
      LibGObject.g_object_get(self, "timeout", pointerof(value), Pointer(Void).null)
      value
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

    def initialize(title : ::String)
      # adw_toast_new: (Constructor)
      # Returns: (transfer full)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_toast_new(title)

      # Return value handling
      @pointer = _retval
    end

    def dismiss : Nil
      # adw_toast_dismiss: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_toast_dismiss(self)

      # Return value handling
    end

    def action_name : ::String?
      # adw_toast_get_action_name: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_toast_get_action_name(self)

      # Return value handling
      ::String.new(_retval) unless _retval.null?
    end

    def action_target_value : GLib::Variant?
      # adw_toast_get_action_target_value: (Method)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_toast_get_action_target_value(self)

      # Return value handling
      GLib::Variant.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def button_label : ::String?
      # adw_toast_get_button_label: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_toast_get_button_label(self)

      # Return value handling
      ::String.new(_retval) unless _retval.null?
    end

    def priority : Adw::ToastPriority
      # adw_toast_get_priority: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_toast_get_priority(self)

      # Return value handling
      Adw::ToastPriority.from_value(_retval)
    end

    def timeout : UInt32
      # adw_toast_get_timeout: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_toast_get_timeout(self)

      # Return value handling
      _retval
    end

    def title : ::String
      # adw_toast_get_title: (Method | Getter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      _retval = LibAdw.adw_toast_get_title(self)

      # Return value handling
      ::String.new(_retval)
    end

    def action_name=(action_name : ::String?) : Nil
      # adw_toast_set_action_name: (Method | Setter)
      # @action_name: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      action_name = if action_name.nil?
                      Pointer(LibC::Char).null
                    else
                      action_name.to_unsafe
                    end

      # C call
      LibAdw.adw_toast_set_action_name(self, action_name)

      # Return value handling
    end

    def action_target_value=(action_target : _?) : Nil
      # adw_toast_set_action_target_value: (Method)
      # @action_target: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      action_target = if action_target.nil?
                        Pointer(Void).null
                      else
                        action_target.to_unsafe
                      end
      action_target = GLib::Variant.new(action_target) unless action_target.is_a?(GLib::Variant)

      # C call
      LibAdw.adw_toast_set_action_target_value(self, action_target)

      # Return value handling
    end

    def button_label=(button_label : ::String?) : Nil
      # adw_toast_set_button_label: (Method | Setter)
      # @button_label: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      button_label = if button_label.nil?
                       Pointer(LibC::Char).null
                     else
                       button_label.to_unsafe
                     end

      # C call
      LibAdw.adw_toast_set_button_label(self, button_label)

      # Return value handling
    end

    def detailed_action_name=(detailed_action_name : ::String?) : Nil
      # adw_toast_set_detailed_action_name: (Method)
      # @detailed_action_name: (nullable)
      # Returns: (transfer none)

      # Handle parameters
      detailed_action_name = if detailed_action_name.nil?
                               Pointer(LibC::Char).null
                             else
                               detailed_action_name.to_unsafe
                             end

      # C call
      LibAdw.adw_toast_set_detailed_action_name(self, detailed_action_name)

      # Return value handling
    end

    def priority=(priority : Adw::ToastPriority) : Nil
      # adw_toast_set_priority: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_toast_set_priority(self, priority)

      # Return value handling
    end

    def timeout=(timeout : UInt32) : Nil
      # adw_toast_set_timeout: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_toast_set_timeout(self, timeout)

      # Return value handling
    end

    def title=(title : ::String) : Nil
      # adw_toast_set_title: (Method | Setter)
      # Returns: (transfer none)

      # Handle parameters

      # C call
      LibAdw.adw_toast_set_title(self, title)

      # Return value handling
    end

    struct DismissedSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "dismissed::#{@detail}" : "dismissed"
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

      def connect(block : Proc(Adw::Toast, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Adw::Toast.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Adw::Toast, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Adw::Toast, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), box : Pointer(Void)) {
          sender = Adw::Toast.new(lib_sender, GICrystal::Transfer::None)
          ::Box(Proc(Adw::Toast, Nil)).unbox(box).call(sender)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit : Nil
        LibGObject.g_signal_emit_by_name(@source, "dismissed")
      end
    end

    def dismissed_signal
      DismissedSignal.new(self)
    end
  end
end
