require_relative 'test_base'
require_relative 'one_line_worker'

class QuickRun < TestBase

  def test_worker
    worker = OneLineWorker.new
    worker.queue

    status = worker.wait_until_complete
    p status
    puts "\n\n\nLOG START:"
    puts worker.get_log
    puts "LOG END\n\n\n"
    assert status["status"] == "complete", "Status was not complete, it was #{status["status"]}"
  end

end

