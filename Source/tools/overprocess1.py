import time
import multiprocessing

def cpu_intensive_task():
    start_time = time.time()
    while time.time() - start_time < 10:
        pass

def memory_intensive_task():
    start_time = time.time()
    memory_list = []
    while time.time() - start_time < 10:
        memory_list.append(' ' * 1024 * 1024)

if __name__ == "__main__":
    cpu_process = multiprocessing.Process(target=cpu_intensive_task)
    memory_process = multiprocessing.Process(target=memory_intensive_task)

    try:
        cpu_process.start()
        memory_process.start()

        time.sleep(10)

    except KeyboardInterrupt:
        cpu_process.terminate()
        memory_process.terminate()

    finally:
        cpu_process.join()
        memory_process.join()
