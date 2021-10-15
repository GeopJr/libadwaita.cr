require "../g_object-2.0/object"

module Gtk
  # `GtkSorter` is an object to describe sorting criteria.
  #
  # Its primary user is [class@Gtk.SortListModel]
  #
  # The model will use a sorter to determine the order in which
  # its items should appear by calling [method@Gtk.Sorter.compare]
  # for pairs of items.
  #
  # Sorters may change their sorting behavior through their lifetime.
  # In that case, they will emit the [signal@Gtk.Sorter::changed] signal
  # to notify that the sort order is no longer valid and should be updated
  # by calling gtk_sorter_compare() again.
  #
  # GTK provides various pre-made sorter implementations for common sorting
  # operations. [class@Gtk.ColumnView] has built-in support for sorting lists
  # via the [property@Gtk.ColumnViewColumn:sorter] property, where the user can
  # change the sorting by clicking on list headers.
  #
  # Of course, in particular for large lists, it is also possible to subclass
  # `GtkSorter` and provide one's own sorter.
  class Sorter < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_sorter_get_type
    end

    def changed(change : Gtk::SorterChange) : Nil
      # gtk_sorter_changed: (Method)
      # Returns: (transfer none)

      LibGtk.gtk_sorter_changed(self, change)
    end

    def compare(item1 : GObject::Object, item2 : GObject::Object) : Gtk::Ordering
      # gtk_sorter_compare: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_sorter_compare(self, item1, item2)
      Gtk::Ordering.from_value(_retval)
    end

    def order : Gtk::SorterOrder
      # gtk_sorter_get_order: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_sorter_get_order(self)
      Gtk::SorterOrder.from_value(_retval)
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

      def connect(&block : Proc(Gtk::SorterChange, Nil))
        connect(block)
      end

      def connect_after(&block : Proc(Gtk::SorterChange, Nil))
        connect(block)
      end

      def connect(block : Proc(Gtk::SorterChange, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::SorterChange.from_value(lib_arg0)
          ::Box(Proc(Gtk::SorterChange, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::SorterChange, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          arg0 = Gtk::SorterChange.from_value(lib_arg0)
          ::Box(Proc(Gtk::SorterChange, Nil)).unbox(box).call(arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def connect(block : Proc(Gtk::Sorter, Gtk::SorterChange, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Sorter.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::SorterChange.from_value(lib_arg0)
          ::Box(Proc(Gtk::Sorter, Gtk::SorterChange, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 0)
      end

      def connect_after(block : Proc(Gtk::Sorter, Gtk::SorterChange, Nil))
        box = ::Box.box(block)
        slot = ->(lib_sender : Pointer(Void), lib_arg0 : UInt32, box : Pointer(Void)) {
          sender = Gtk::Sorter.new(lib_sender, GICrystal::Transfer::None)
          arg0 = Gtk::SorterChange.from_value(lib_arg0)
          ::Box(Proc(Gtk::Sorter, Gtk::SorterChange, Nil)).unbox(box).call(sender, arg0)
        }

        LibGObject.g_signal_connect_data(@source, name, slot.pointer,
          GICrystal::ClosureDataManager.register(box), ->GICrystal::ClosureDataManager.deregister, 1)
      end

      def emit(change : Gtk::SorterChange) : Nil
        LibGObject.g_signal_emit_by_name(@source, "changed", change)
      end
    end

    def changed_signal
      ChangedSignal.new(self)
    end
  end
end
