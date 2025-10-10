module.exports = async ({ github, context, keepReleases = 6, keepWorkflowRuns = 6 }) => {
  console.log('🗑️ 开始自动清理工作...');
  
  // 清理 Releases
  const releases = await github.rest.repos.listReleases({
    owner: context.repo.owner,
    repo: context.repo.repo,
    per_page: 100
  });

  const sortedReleases = releases.data.sort((a, b) => 
    new Date(b.created_at) - new Date(a.created_at)
  );

  let deletedReleases = 0;
  for (let i = keepReleases; i < sortedReleases.length; i++) {
    const release = sortedReleases[i];
    try {
      console.log(`🗑️ 删除Release: ${release.tag_name}`);
      await github.rest.repos.deleteRelease({
        owner: context.repo.owner,
        repo: context.repo.repo,
        release_id: release.id
      });
      deletedReleases++;
    } catch (error) {
      console.log(`❌ 删除Release失败: ${release.tag_name}`);
    }
  }
  console.log(`✅ Releases清理完成: 删除了 ${deletedReleases} 个`);

  // 清理工作流记录
  const workflows = await github.rest.actions.listWorkflowRunsForRepo({
    owner: context.repo.owner,
    repo: context.repo.repo,
    per_page: 100
  });

  const filteredWorkflows = workflows.data.workflow_runs.filter(run => 
    run.id !== context.runId
  );

  const sortedWorkflows = filteredWorkflows.sort((a, b) => 
    new Date(b.created_at) - new Date(a.created_at)
  );

  let deletedWorkflows = 0;
  for (let i = keepWorkflowRuns; i < sortedWorkflows.length; i++) {
    const run = sortedWorkflows[i];
    try {
      console.log(`🗑️ 删除工作流记录: #${run.id} ${run.name}`);
      await github.rest.actions.deleteWorkflowRun({
        owner: context.repo.owner,
        repo: context.repo.repo,
        run_id: run.id
      });
      deletedWorkflows++;
    } catch (error) {
      console.log(`❌ 删除工作流记录失败: #${run.id}`);
    }
  }
  console.log(`✅ 工作流记录清理完成: 删除了 ${deletedWorkflows} 个`);
};
