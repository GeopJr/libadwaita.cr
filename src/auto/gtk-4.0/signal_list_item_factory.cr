require "./list_item_factory"

module Gtk
  # `GtkSignalListItemFactory` is a `GtkListItemFactory` that emits signals
  # to to manage listitems.
  #
  # Signals are emitted for every listitem in the same order:
  #
  #  1. `Gtk::SignalListItemFactory::#setup` is emitted to set up permanent
  #  things on the listitem. This usually means constructing the widgets used in
  #  the row and adding them to the listitem.
  #
  #  2. `Gtk::SignalListItemFactory::#bind` is emitted to bind the item passed
  #  via `Gtk::ListItem#item` to the widgets that have been created in
  #  step 1 or to add item-specific widgets. Signals are connected to listen to
  #  changes - both to changes in the item to update the widgets or to changes
  #  in the widgets to update the item. After this signal has been called, the
  #  listitem may be shown in a list widget.
  #
  #  3. `Gtk::SignalListItemFactory::#unbind` is emitted to undo everything
  #  done in step 2. Usually this means disconnecting signal handlers. Once this
  #  signal has been called, the listitem will no longer be used in a list
  #  widget.
  #
  #  4. `Gtk::SignalListItemFactory::#bind` and
  #  `Gtk::SignalListItemFactory::#unbind` may be emitted multiple times
  #  again to bind the listitem for use with new items. By reusing listitems,
  #  potentially costly setup can be avoided. However, it means code needs to
  #  make sure to properly clean up the listitem in step 3 so that no information
  #  from the previous use leaks into the next use.
  #
  # 5. `Gtk::SignalListItemFactory::#teardown` is emitted to allow undoing
  # the effects of `Gtk::SignalListItemFactory::#setup`. After this signal
  # was emitted on a listitem, the listitem will be destroyed and not be used again.
  #
  # Note that during the signal emissions, changing properties on the
  # `GtkListItem`s passed will not trigger notify signals as the listitem's
  # notifications are frozen. See g_object_freeze_notify() for details.
  #
  # For tracking changes in other properties in the `GtkListItem`, the
  # ::notify signal is recommended. The signal can be connected in the
  # `Gtk::SignalListItemFactory::#setup` signal and removed again during
  # `Gtk::SignalListItemFactory::#teardown`.
  @[GObject::GeneratedWrapper]
  class SignalListItemFactory < ListItemFactory
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::SignalListItemFactoryClass), class_init,
        sizeof(LibGtk::SignalListItemFactory), instance_init, 0)
    end

    GICrystal.define_new_method(SignalListItemFactory, g_object_get_qdata, g_object_set_qdata)

    # Initialize a new `SignalListItemFactory`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_signal_list_item_factory_get_type
    end

    # Creates a new `GtkSignalListItemFactory`.
    #
    # You need to connect signal handlers before you use it.
    def initialize
      # gtk_signal_list_item_factory_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_signal_list_item_factory_new

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Emitted when a new `Gtk::ListItem#item` has been set
    # on the @listitem and should be bound for use.
    #
    # After this signal was emitted, the listitem might be shown in
    # a `Gtk#ListView` or other list widget.
    #
    # The `Gtk::SignalListItemFactory::#unbind` signal is the
    # opposite of this signal and can be used to undo everything done
    # in this signal.
    struct BindSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "bind::#{@detail}" : "bind"
      end

      def connect(&block : Proc(Gtk::ListItem, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::ListItem, Nil))
        connect(block)
      end

      def connect(handler : Proc(Gtk::ListItem, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_listitem : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          listitem = Gtk::ListItem.new(lib_listitem, :none)
          ::Box(Proc(Gtk::ListItem, Nil)).unbox(_lib_box).call(listitem)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::ListItem, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_listitem : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          listitem = Gtk::ListItem.new(lib_listitem, :none)
          ::Box(Proc(Gtk::ListItem, Nil)).unbox(_lib_box).call(listitem)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_listitem : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::SignalListItemFactory.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          listitem = Gtk::ListItem.new(lib_listitem, :none)
          ::Box(Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil)).unbox(_lib_box).call(_sender, listitem)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_listitem : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::SignalListItemFactory.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          listitem = Gtk::ListItem.new(lib_listitem, :none)
          ::Box(Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil)).unbox(_lib_box).call(_sender, listitem)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(listitem : Gtk::ListItem) : Nil
        LibGObject.g_signal_emit_by_name(@source, "bind", listitem)
      end
    end

    def bind_signal
      BindSignal.new(self)
    end

    # Emitted when a new listitem has been created and needs to be setup for use.
    #
    # It is the first signal emitted for every listitem.
    #
    # The `Gtk::SignalListItemFactory::#teardown` signal is the opposite
    # of this signal and can be used to undo everything done in this signal.
    struct SetupSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "setup::#{@detail}" : "setup"
      end

      def connect(&block : Proc(Gtk::ListItem, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::ListItem, Nil))
        connect(block)
      end

      def connect(handler : Proc(Gtk::ListItem, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_listitem : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          listitem = Gtk::ListItem.new(lib_listitem, :none)
          ::Box(Proc(Gtk::ListItem, Nil)).unbox(_lib_box).call(listitem)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::ListItem, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_listitem : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          listitem = Gtk::ListItem.new(lib_listitem, :none)
          ::Box(Proc(Gtk::ListItem, Nil)).unbox(_lib_box).call(listitem)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_listitem : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::SignalListItemFactory.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          listitem = Gtk::ListItem.new(lib_listitem, :none)
          ::Box(Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil)).unbox(_lib_box).call(_sender, listitem)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_listitem : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::SignalListItemFactory.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          listitem = Gtk::ListItem.new(lib_listitem, :none)
          ::Box(Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil)).unbox(_lib_box).call(_sender, listitem)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(listitem : Gtk::ListItem) : Nil
        LibGObject.g_signal_emit_by_name(@source, "setup", listitem)
      end
    end

    def setup_signal
      SetupSignal.new(self)
    end

    # Emitted when a listitem is about to be destroyed.
    #
    # It is the last signal ever emitted for this @listitem.
    #
    # This signal is the opposite of the `Gtk::SignalListItemFactory::#setup`
    # signal and should be used to undo everything done in that signal.
    struct TeardownSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "teardown::#{@detail}" : "teardown"
      end

      def connect(&block : Proc(Gtk::ListItem, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::ListItem, Nil))
        connect(block)
      end

      def connect(handler : Proc(Gtk::ListItem, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_listitem : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          listitem = Gtk::ListItem.new(lib_listitem, :none)
          ::Box(Proc(Gtk::ListItem, Nil)).unbox(_lib_box).call(listitem)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::ListItem, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_listitem : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          listitem = Gtk::ListItem.new(lib_listitem, :none)
          ::Box(Proc(Gtk::ListItem, Nil)).unbox(_lib_box).call(listitem)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_listitem : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::SignalListItemFactory.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          listitem = Gtk::ListItem.new(lib_listitem, :none)
          ::Box(Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil)).unbox(_lib_box).call(_sender, listitem)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_listitem : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::SignalListItemFactory.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          listitem = Gtk::ListItem.new(lib_listitem, :none)
          ::Box(Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil)).unbox(_lib_box).call(_sender, listitem)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(listitem : Gtk::ListItem) : Nil
        LibGObject.g_signal_emit_by_name(@source, "teardown", listitem)
      end
    end

    def teardown_signal
      TeardownSignal.new(self)
    end

    # Emitted when a listitem has been removed from use in a list widget
    # and its new `Gtk::ListItem#item` is about to be unset.
    #
    # This signal is the opposite of the `Gtk::SignalListItemFactory::#bind`
    # signal and should be used to undo everything done in that signal.
    struct UnbindSignal
      @source : GObject::Object
      @detail : String?

      def initialize(@source, @detail = nil)
      end

      def [](detail : String) : self
        raise ArgumentError.new("This signal already have a detail") if @detail
        self.class.new(@source, detail)
      end

      def name
        @detail ? "unbind::#{@detail}" : "unbind"
      end

      def connect(&block : Proc(Gtk::ListItem, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::ListItem, Nil))
        connect(block)
      end

      def connect(handler : Proc(Gtk::ListItem, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_listitem : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          listitem = Gtk::ListItem.new(lib_listitem, :none)
          ::Box(Proc(Gtk::ListItem, Nil)).unbox(_lib_box).call(listitem)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::ListItem, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_listitem : Pointer(Void), _lib_box : Pointer(Void)) {
          # Generator::BuiltInTypeArgPlan
          listitem = Gtk::ListItem.new(lib_listitem, :none)
          ::Box(Proc(Gtk::ListItem, Nil)).unbox(_lib_box).call(listitem)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(handler : Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_listitem : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::SignalListItemFactory.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          listitem = Gtk::ListItem.new(lib_listitem, :none)
          ::Box(Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil)).unbox(_lib_box).call(_sender, listitem)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(handler : Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil))
        _box = ::Box.box(handler)
        handler = ->(_lib_sender : Pointer(Void), lib_listitem : Pointer(Void), _lib_box : Pointer(Void)) {
          _sender = Gtk::SignalListItemFactory.new(_lib_sender, GICrystal::Transfer::None)
          # Generator::BuiltInTypeArgPlan
          listitem = Gtk::ListItem.new(lib_listitem, :none)
          ::Box(Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil)).unbox(_lib_box).call(_sender, listitem)
        }.pointer

        LibGObject.g_signal_connect_data(@source, name, handler,
          GICrystal::ClosureDataManager.register(_box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(listitem : Gtk::ListItem) : Nil
        LibGObject.g_signal_emit_by_name(@source, "unbind", listitem)
      end
    end

    def unbind_signal
      UnbindSignal.new(self)
    end
  end
end
