require "./list_item_factory"

module Gtk
  # `GtkSignalListItemFactory` is a `GtkListItemFactory` that emits signals
  # to to manage listitems.
  #
  # Signals are emitted for every listitem in the same order:
  #
  #  1. [signal@Gtk.SignalListItemFactory::setup] is emitted to set up permanent
  #  things on the listitem. This usually means constructing the widgets used in
  #  the row and adding them to the listitem.
  #
  #  2. [signal@Gtk.SignalListItemFactory::bind] is emitted to bind the item passed
  #  via [property@Gtk.ListItem:item] to the widgets that have been created in
  #  step 1 or to add item-specific widgets. Signals are connected to listen to
  #  changes - both to changes in the item to update the widgets or to changes
  #  in the widgets to update the item. After this signal has been called, the
  #  listitem may be shown in a list widget.
  #
  #  3. [signal@Gtk.SignalListItemFactory::unbind] is emitted to undo everything
  #  done in step 2. Usually this means disconnecting signal handlers. Once this
  #  signal has been called, the listitem will no longer be used in a list
  #  widget.
  #
  #  4. [signal@Gtk.SignalListItemFactory::bind] and
  #  [signal@Gtk.SignalListItemFactory::unbind] may be emitted multiple times
  #  again to bind the listitem for use with new items. By reusing listitems,
  #  potentially costly setup can be avoided. However, it means code needs to
  #  make sure to properly clean up the listitem in step 3 so that no information
  #  from the previous use leaks into the next use.
  #
  # 5. [signal@Gtk.SignalListItemFactory::teardown] is emitted to allow undoing
  # the effects of [signal@Gtk.SignalListItemFactory::setup]. After this signal
  # was emitted on a listitem, the listitem will be destroyed and not be used again.
  #
  # Note that during the signal emissions, changing properties on the
  # `GtkListItem`s passed will not trigger notify signals as the listitem's
  # notifications are frozen. See g_object_freeze_notify() for details.
  #
  # For tracking changes in other properties in the `GtkListItem`, the
  # ::notify signal is recommended. The signal can be connected in the
  # [signal@Gtk.SignalListItemFactory::setup] signal and removed again during
  # [signal@Gtk.SignalListItemFactory::teardown].
  class SignalListItemFactory < ListItemFactory
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_signal_list_item_factory_get_type
    end

    def initialize
      # gtk_signal_list_item_factory_new: (Constructor)
      # Returns: (transfer full)

      _retval = LibGtk.gtk_signal_list_item_factory_new
      @pointer = _retval
    end

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

      def connect(block : Proc(Gtk::ListItem, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::ListItem.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListItem, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ListItem, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::ListItem.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListItem, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::SignalListItemFactory.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::ListItem.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::SignalListItemFactory.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::ListItem.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(listitem : Gtk::ListItem) : Nil
        LibGObject.g_signal_emit_by_name(@source, "bind", listitem)
      end
    end

    def bind_signal
      BindSignal.new(self)
    end

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

      def connect(block : Proc(Gtk::ListItem, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::ListItem.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListItem, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ListItem, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::ListItem.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListItem, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::SignalListItemFactory.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::ListItem.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::SignalListItemFactory.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::ListItem.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(listitem : Gtk::ListItem) : Nil
        LibGObject.g_signal_emit_by_name(@source, "setup", listitem)
      end
    end

    def setup_signal
      SetupSignal.new(self)
    end

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

      def connect(block : Proc(Gtk::ListItem, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::ListItem.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListItem, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ListItem, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::ListItem.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListItem, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::SignalListItemFactory.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::ListItem.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::SignalListItemFactory.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::ListItem.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(listitem : Gtk::ListItem) : Nil
        LibGObject.g_signal_emit_by_name(@source, "teardown", listitem)
      end
    end

    def teardown_signal
      TeardownSignal.new(self)
    end

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

      def connect(block : Proc(Gtk::ListItem, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::ListItem.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListItem, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::ListItem, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          arg0 = Gtk::ListItem.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::ListItem, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::SignalListItemFactory.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::ListItem.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : Pointer(Void), box : Pointer(Void)) {
          sender = Gtk::SignalListItemFactory.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::ListItem.new(lib_arg0, GICrystal::Transfer::None)
          ::Box(Proc(Gtk::SignalListItemFactory, Gtk::ListItem, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
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
